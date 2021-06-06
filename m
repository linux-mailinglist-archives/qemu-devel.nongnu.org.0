Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907B839D17F
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 22:49:57 +0200 (CEST)
Received: from localhost ([::1]:47688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpziW-0001dF-5V
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 16:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael@ralisi.de>) id 1lpwcJ-0003X7-Ri
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 13:31:19 -0400
Received: from no.mail.very.legit.solutions ([116.202.25.44]:53880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael@ralisi.de>) id 1lpwc9-0007LO-FM
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 13:31:19 -0400
Received: by no.mail.very.legit.solutions (OpenSMTPD) with ESMTPSA id cb773df3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sun, 6 Jun 2021 17:31:02 +0000 (UTC)
Received: by der.bie.st (OpenSMTPD) with ESMTPSA id fc0077c1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sun, 6 Jun 2021 17:30:59 +0000 (UTC)
From: Raphael Lisicki <raphael@ralisi.de>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC] USB Video Class device emulation.
Date: Sun,  6 Jun 2021 19:30:58 +0200
Message-Id: <20210606173058.9890-1-raphael@ralisi.de>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=116.202.25.44; envelope-from=raphael@ralisi.de;
 helo=no.mail.very.legit.solutions
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NO_DNS_FOR_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 06 Jun 2021 16:48:55 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: claunia@claunia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This continues work started by Natalia Portillo <claunia@claunia.com>, as
submitted here: https://lists.nongnu.org/archive/html/qemu-devel/2010-06/msg01126.html

I have updated the changes so that the patch now applies to v4.2.1. Video
input has been expanded to support user-mode buffers so that an UVC device
itself can be used as input for this module.

My work on this has already stalled some weeks ago and I am submitting it in
case somebody might be interested.

Best regards
Raphael
---
 hw/usb/Makefile.objs |    1 +
 hw/usb/usb-uvc.c     | 1435 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1436 insertions(+)
 create mode 100644 hw/usb/usb-uvc.c

diff --git a/hw/usb/Makefile.objs b/hw/usb/Makefile.objs
index 303ac084a0..83e460af8a 100644
--- a/hw/usb/Makefile.objs
+++ b/hw/usb/Makefile.objs
@@ -26,6 +26,7 @@ common-obj-$(CONFIG_USB_AUDIO)        += dev-audio.o
 common-obj-$(CONFIG_USB_SERIAL)       += dev-serial.o
 common-obj-$(CONFIG_USB_NETWORK)      += dev-network.o
 common-obj-$(CONFIG_USB_BLUETOOTH)    += dev-bluetooth.o
+common-obj-$(CONFIG_LINUX)            += usb-uvc.o
 
 ifeq ($(CONFIG_USB_SMARTCARD),y)
 common-obj-y                          += dev-smartcard-reader.o
diff --git a/hw/usb/usb-uvc.c b/hw/usb/usb-uvc.c
new file mode 100644
index 0000000000..a7ffba68d8
--- /dev/null
+++ b/hw/usb/usb-uvc.c
@@ -0,0 +1,1435 @@
+/*
+ * USB Video Class Device emulation.
+ *
+ * Copyright (c) 2010 Claunia.com
+ * Written by Natalia Portillo <natalia@claunia.com>
+ *
+ * Based on hw/usb-hid.c:
+ * Copyright (c) 2005 Fabrice Bellard
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation in its version 2.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+#include "usb.h"
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qemu/error-report.h"
+#include "hw/usb.h"
+#include "hw/usb/desc.h"
+#include "hw/qdev-properties.h"
+#include "hw/hw.h"
+#include <stdio.h>
+#include <fcntl.h>
+#include <errno.h>
+#include "qapi/error.h"
+// V4L2 ioctls
+#include <sys/ioctl.h>
+#include <linux/videodev2.h>
+
+#define DEBUG_UVC
+
+#ifdef DEBUG_UVC
+#define DPRINTF(fmt, ...) \
+do { printf("usb-uvc: " fmt , ## __VA_ARGS__); } while (0)
+#else
+#define DPRINTF(fmt, ...) do {} while(0)
+#endif
+
+/* USB Video Class Request codes */
+#define USB_UVC_RC_UNDEFINED	0x00
+#define USB_UVC_SET_CUR			0x01
+#define USB_UVC_GET_CUR			0x81
+#define USB_UVC_GET_MIN			0x82
+#define USB_UVC_GET_MAX			0x83
+#define USB_UVC_GET_RES			0x84
+#define USB_UVC_GET_LEN			0x85
+#define USB_UVC_GET_INFO		0x86
+#define USB_UVC_GET_DEF			0x87
+
+/* USB Video Class Request types */
+#define UVCSetVideoControl		0x2100
+#define UVCSetVideoStreaming	0x2200
+#define UVCGetVideoControl		0xA100
+#define UVCGetVideoStreaming	0xA200
+
+
+enum v4l2_api {
+	V4L2_API_UNKOWN = 0,
+	V4L2_API_READ = 1,
+	V4L2_API_USERPTRS = 2,
+};
+
+
+
+typedef struct USBUVCState {
+    USBDevice dev;
+	char	current_input;
+	char	*v4l2_device;
+	size_t	height;
+	size_t	width;
+
+
+	int v4l2_fd;
+	enum v4l2_api v4l2_api;
+	char *frame;
+	char *frame_start;
+	char* frame_storage[3];
+	int frame_id;
+	int frame_remaining_bytes;
+	int frame_max_length;
+
+	/* values in 16bit, as by UVC. Lets assume the 64bit values from V4L2 fit. Report error if the assumption breaks. */
+	struct {
+		bool supported;
+		int16_t minimum;
+		int16_t maximum;
+		int16_t resolution;
+		int16_t default_value;
+		int16_t current_value;
+	} brightness;
+} USBUVCState;
+
+
+
+static void get_frame_read_api(USBUVCState *s)
+{
+	DPRINTF("Getting frame.\n");
+	s->frame = s->frame_start;
+	int frame_length = read(s->v4l2_fd, s->frame+2, s->frame_max_length);
+	
+	if(frame_length == -1)
+	{
+		DPRINTF("Error while reading frame. errno %d\n", errno);
+	}
+	else
+	{
+		s->frame[0] = 2;
+		s->frame_id = s->frame_id ^ 1;
+		s->frame[1] = 0x82 | s->frame_id;
+		s->frame_remaining_bytes = frame_length+2;
+		DPRINTF("Got a frame of %d bytes.\n", frame_length);
+	}
+	
+	return;
+}
+
+
+
+static void get_frame_userptrs_api(USBUVCState *s)
+{
+	struct v4l2_buffer buf;
+	memset(&buf, 0, sizeof(buf));
+	buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	buf.memory = V4L2_MEMORY_USERPTR;
+	//printf("starting VIDIOC_DQBUF ioctl\n");
+	int ret_err = ioctl(s->v4l2_fd,  VIDIOC_DQBUF, &buf);
+	//printf("ended VIDIOC_DQBUF ioctl\n");
+	if(ret_err==-1)
+	{
+		switch(errno)
+		{
+			case EINVAL:
+				printf("VIDIOC_DQBUF einval.\n");
+				break;
+			default:
+				printf("VIDIOC_DQBUF returned unknown error %d.\n", errno);
+				break;
+		}
+		printf("V4L2 IOCTL VIDIOC_DQBUF failed\n");
+		return;
+	}
+
+	char* ptr = (void*)buf.m.userptr;
+	//printf("got frame of length %d from DMA buf %d, starting at %p\n", buf.bytesused, buf.index, ptr);
+
+
+	buf.m.userptr = (unsigned long)s->frame_start+2;
+
+	s->frame_start = ptr - 2;
+	s->frame = s->frame_start;
+
+	int frame_length = buf.bytesused;
+
+	s->frame[0] = 2;
+	s->frame_id = s->frame_id ^ 1;
+	s->frame[1] = 0x82 | s->frame_id;
+	s->frame_remaining_bytes = frame_length+2;
+
+
+	//printf("starting VIDIOC_QBUF ioctl\n");
+	ret_err = ioctl(s->v4l2_fd,  VIDIOC_QBUF, &buf);
+	//printf("ended VIDIOC_QBUF ioctl\n");
+	if(ret_err==-1)
+	{
+		printf("VIDIOC_QBUF failed\n");
+		return;
+	}
+}
+
+static void get_frame_read(USBUVCState *s)
+{
+	switch (s->v4l2_api) {
+		case V4L2_API_READ:
+			return get_frame_read_api(s);
+		case V4L2_API_USERPTRS:
+			return get_frame_userptrs_api(s);
+		default:
+			DPRINTF("Unhandled api type %d\n", s->v4l2_api);
+	}
+}
+
+
+
+static void usb_uvc_handle_reset(USBDevice *dev)
+{
+	DPRINTF("Reset called\n");
+}
+
+
+
+static int assign_query_control(int fd, int cid, struct v4l2_queryctrl* queryctrl)
+{
+
+
+memset(queryctrl, 0, sizeof(struct v4l2_queryctrl));
+queryctrl->id = cid;
+
+if (-1 == ioctl(fd, VIDIOC_QUERYCTRL, queryctrl)) {
+    if (errno != EINVAL) {
+        perror("assign_query_control");
+        exit(EXIT_FAILURE);
+    } else {
+        printf("V4L2_CID_BRIGHTNESS is not supportedn");
+    }
+} else if (queryctrl->flags & V4L2_CTRL_FLAG_DISABLED) {
+    printf("V4L2_CID_BRIGHTNESS is not supportedn");
+} else {
+	return 0;
+}
+	return -1;
+}
+
+
+static void usb_uvc_handle_control(USBDevice *dev, USBPacket *p, int request, int value,
+								  int index, int length, uint8_t *data)
+{
+	int ret = 0;
+	USBUVCState *s = DO_UPCAST(USBUVCState, dev, dev);
+	
+	DPRINTF("Control called\n");
+	//	DPRINTF("Request: 0x%08X\n", request);
+	//	DPRINTF("Value: 0x%08X\n", value);
+	//	DPRINTF("Index: 0x%08X\n", index);
+	//	DPRINTF("Length: 0x%08X\n", length);
+
+      ret = usb_desc_handle_control(dev, p, request, value, index, length, data);
+      if (ret >= 0) {
+          DPRINTF("Control handled generically\n");
+          return;
+      }
+	ret = 0;
+
+	struct commit_control_msg {
+		uint16_t bmHint;
+		uint8_t bFormatIndex;
+		uint8_t bFrameIndex;
+		uint32_t dwFrameInterval;
+		uint16_t wKeyFrameRate;
+		uint16_t wPFrameRate;
+		uint16_t wCompQuality;
+		uint16_t wCompWindowSize;
+		uint16_t wDelay;
+		uint32_t dwMaxVideoFrameSize;
+		uint32_t dwMaxPayloadTransferSize;
+	} QEMU_PACKED;
+	QEMU_BUILD_BUG_ON(sizeof (struct commit_control_msg) != 26);
+
+	
+	switch(request)
+	{
+		case EndpointOutRequest | USB_REQ_CLEAR_FEATURE:
+			break;
+		case UVCGetVideoControl | USB_UVC_GET_CUR:
+			ret = 0;
+			
+			if((index&0xFF) == 0x01 && ((value&0xFF00) == 0x0100 || (value&0xFF00) == 0x0200))
+			{
+				DPRINTF("USB Request: Get video control current setting attribute for interface %d\n", index&0xFF);
+				if((value&0xFF00) == 0x0100)
+					DPRINTF("\tVS_PROBE_CONTROL\n");
+				else
+					DPRINTF("\tVS_COMMIT_CONTROL\n");
+				
+				if(length != 26)
+				{
+					DPRINTF("USB Request: Requested %d bytes, expected 26 bytes\n", length);
+					goto fail;
+				}
+
+				struct commit_control_msg msg;
+				memset(&msg, 0, sizeof(msg));
+				memcpy(&msg, data, MIN(length, sizeof(msg)));
+
+
+				msg.dwFrameInterval = cpu_to_le32(666666);
+				msg.wKeyFrameRate = cpu_to_le16(1);
+				msg.wPFrameRate = cpu_to_le16(0);
+				msg.wCompQuality = cpu_to_le16(0);
+				msg.wCompWindowSize = cpu_to_le16(1);
+				msg.wDelay = cpu_to_le16(0x20);
+				msg.dwMaxVideoFrameSize = cpu_to_le32(s->frame_max_length);
+				msg.dwMaxPayloadTransferSize = cpu_to_le32(s->frame_max_length);
+				memcpy(data, &msg, sizeof(msg));
+				ret = sizeof(msg);
+			}
+			else if((index&0xFF00) == 0x0400 && (value&0xFF00) == 0x0100) // Setting input
+			{
+				DPRINTF("USB Request: Asking for current input\n");
+				if(length != 1)
+				{
+					DPRINTF("USB Request: Requested %d bytes, expected 1 byte\n", length);
+					goto fail;
+				}
+				
+				data[0] = s->current_input;
+				ret = 1;
+			}
+			else if((index&0xFF00) == 0x0500 && (value&0xFF00) == 0x0200) // PU_BRIGHTNESS_CONTROL of PROCESSING_UNIT
+			{
+				DPRINTF("USB Resquest: Asking for current brightness\n");
+				if(length != 2)
+				{
+					DPRINTF("USB Request: Requested %d bytes, expected 2 bytes\n", length);
+					goto fail;
+				}
+				
+				if (s->brightness.supported) {
+					printf("current brightness value is %d\n", s->brightness.current_value);
+					int16_t for_writing = cpu_to_le16(s->brightness.current_value);
+					memcpy(data, &for_writing, 2);
+					ret = 2;
+				}
+				else {
+					data[0] = 1;
+					data[1] = 0;
+					ret = 2;
+				}
+			}
+			else
+				goto fail;
+			break;
+		case UVCGetVideoControl | USB_UVC_GET_MIN:
+			ret = 0;
+			
+			if((index&0xFF) == 0x01 && ((value&0xFF00) == 0x0100 || (value&0xFF00) == 0x0200))
+			{
+				DPRINTF("USB Request: Get video control minimum setting attribute for interface %d\n", index&0xFF);
+				
+				if(length != 26)
+				{
+					DPRINTF("USB Request: Requested %d bytes, expected 26 bytes\n", length);
+					goto fail;
+				}
+				
+				struct commit_control_msg msg;
+				memset(&msg, 0, sizeof(msg));
+				memcpy(&msg, data, MIN(length, sizeof(msg)));
+
+
+				msg.dwFrameInterval = cpu_to_le32(666666);
+				msg.wKeyFrameRate = cpu_to_le16(1);
+				msg.wPFrameRate = cpu_to_le16(0);
+				msg.wCompQuality = cpu_to_le16(0);
+				msg.wCompWindowSize = cpu_to_le16(1);
+				msg.wDelay = cpu_to_le16(0x20);
+				msg.dwMaxVideoFrameSize = cpu_to_le32(s->frame_max_length);
+				msg.dwMaxPayloadTransferSize = cpu_to_le32(s->frame_max_length);
+				memcpy(data, &msg, sizeof(msg));
+				ret = sizeof(msg);
+			}
+			else if((index&0xFF00) == 0x0400 && (value&0xFF00) == 0x0100) // Setting input
+			{
+				DPRINTF("USB Request: Asking for minimum input\n");
+				if(length != 1)
+				{
+					DPRINTF("USB Request: Requested %d bytes, expected 1 byte\n", length);
+					goto fail;
+				}
+				
+				data[0] = 0;
+				ret = 1;
+			}
+			else if((index&0xFF00) == 0x0500 && (value&0xFF00) == 0x0200) // PU_BRIGHTNESS_CONTROL of PROCESSING_UNIT
+			{
+				DPRINTF("USB Resquest: Asking for minimum brightness\n");
+				if(length != 2)
+				{
+					DPRINTF("USB Request: Requested %d bytes, expected 2 bytes\n", length);
+					goto fail;
+				}
+				
+				if (s->brightness.supported) {
+					printf("min brightness value is %d\n", s->brightness.minimum);
+					int16_t for_writing = cpu_to_le16(s->brightness.minimum);
+					memcpy(data, &for_writing, 2);
+					ret = 2;
+				}
+				else {
+					data[0] = 1;
+					data[1] = 0;
+					ret = 2;
+				}
+			}
+			else
+				goto fail;
+			break;
+		case UVCGetVideoControl | USB_UVC_GET_MAX:
+			if((index&0xFF) == 0x01 && ((value&0xFF00) == 0x0100 || (value&0xFF00) == 0x0200))
+			{
+				DPRINTF("USB Request: Get video control maximum setting attribute for interface %d\n", index&0xFF);
+				
+				if(length != 26)
+				{
+					DPRINTF("USB Request: Requested %d bytes, expected 26 bytes\n", length);
+					goto fail;
+				}
+				
+				struct commit_control_msg msg;
+				memset(&msg, 0, sizeof(msg));
+				memcpy(&msg, data, MIN(length, sizeof(msg)));
+
+
+				msg.dwFrameInterval = cpu_to_le32(666666);
+				msg.wKeyFrameRate = cpu_to_le16(1);
+				msg.wPFrameRate = cpu_to_le16(0);
+				msg.wCompQuality = cpu_to_le16(0);
+				msg.wCompWindowSize = cpu_to_le16(1);
+				msg.wDelay = cpu_to_le16(0x20);
+				msg.dwMaxVideoFrameSize = cpu_to_le32(s->frame_max_length);
+				msg.dwMaxPayloadTransferSize = cpu_to_le32(s->frame_max_length);
+				memcpy(data, &msg, sizeof(msg));
+				ret = sizeof(msg);
+			}
+			else if((index&0xFF00) == 0x0400 && (value&0xFF00) == 0x0100) // Setting input
+			{
+				DPRINTF("USB Request: Asking maximum input\n");
+				if(length != 1)
+				{
+					DPRINTF("USB Request: Requested %d bytes, expected 1 byte\n", length);
+					goto fail;
+				}
+				
+				data[0] = 1;
+				ret = 1;
+			}					
+			else if((index&0xFF00) == 0x0500 && (value&0xFF00) == 0x0200) // PU_BRIGHTNESS_CONTROL of PROCESSING_UNIT
+			{
+				DPRINTF("USB Resquest: Asking for maximum brightness\n");
+				if(length != 2)
+				{
+					DPRINTF("USB Request: Requested %d bytes, expected 2 bytes\n", length);
+					goto fail;
+				}
+				
+				if (s->brightness.supported) {
+					printf("max brightness value is %d\n", s->brightness.maximum);
+					int16_t for_writing = cpu_to_le16(s->brightness.maximum);
+					memcpy(data, &for_writing, 2);
+					ret = 2;
+				}
+				else {
+					data[0] = 1;
+					data[1] = 0;
+					ret = 2;
+				}
+			}
+			else
+				goto fail;
+			break;
+		case UVCGetVideoControl | USB_UVC_GET_DEF:
+			if((index&0xFF) == 0x01 && ((value&0xFF00) == 0x0100 || (value&0xFF00) == 0x0200))
+			{
+				DPRINTF("USB Request: Get video control default setting attribute for interface %d\n", index&0xFF);
+				
+				if(length != 26)
+				{
+					DPRINTF("USB Request: Requested %d bytes, expected 26 bytes\n", length);
+					goto fail;
+				}
+				
+				struct commit_control_msg msg;
+				memset(&msg, 0, sizeof(msg));
+				memcpy(&msg, data, MIN(length, sizeof(msg)));
+
+
+				msg.dwFrameInterval = cpu_to_le32(666666);
+				msg.wKeyFrameRate = cpu_to_le16(1);
+				msg.wPFrameRate = cpu_to_le16(0);
+				msg.wCompQuality = cpu_to_le16(0);
+				msg.wCompWindowSize = cpu_to_le16(1);
+				msg.wDelay = cpu_to_le16(0x20);
+				msg.dwMaxVideoFrameSize = cpu_to_le32(s->frame_max_length);
+				msg.dwMaxPayloadTransferSize = cpu_to_le32(s->frame_max_length);
+				memcpy(data, &msg, sizeof(msg));
+				ret = sizeof(msg);
+			}
+			else if((index&0xFF00) == 0x0400 && (value&0xFF00) == 0x0100) // Setting input
+			{
+				DPRINTF("USB Request: Asking for default input\n");
+				if(length != 1)
+				{
+					DPRINTF("USB Request: Requested %d bytes, expected 1 byte\n", length);
+					goto fail;
+				}
+				
+				data[0] = 0;
+				ret = 1;
+			}
+			else if((index&0xFF00) == 0x0500 && (value&0xFF00) == 0x0200) // PU_BRIGHTNESS_CONTROL of PROCESSING_UNIT
+			{
+				DPRINTF("USB Resquest: Asking for default brightness\n");
+				if(length != 2)
+				{
+					DPRINTF("USB Request: Requested %d bytes, expected 2 bytes\n", length);
+					goto fail;
+				}
+				if (s->brightness.supported) {
+					printf("default value is %d\n", s->brightness.default_value);
+					int16_t for_writing = cpu_to_le16(s->brightness.default_value);
+					memcpy(data, &for_writing, 2);
+					ret = 2;
+				}
+				else {
+					data[0] = 1;
+					data[1] = 0;
+					ret = 2;
+				}
+			}
+			else
+				goto fail;
+			break;
+		case UVCSetVideoControl | USB_UVC_SET_CUR:
+			DPRINTF("USB Request: Set video control setting attribute for interface %d\n", index&0xFF);
+			
+			ret = 0;
+			
+			if((index&0xFF) == 0x01 && ((value&0xFF00) == 0x0100 || (value&0xFF00) == 0x0200))
+			{
+				if((value&0xFF00) == 0x0100)
+					DPRINTF("\tVS_PROBE_CONTROL\n");
+				else
+					DPRINTF("\tVS_COMMIT_CONTROL\n");
+				
+				if(length != 26)
+				{
+					DPRINTF("USB Request: Requested %d bytes, expected 26 bytes\n", length);
+					goto fail;
+				}
+
+				struct commit_control_msg msg;
+				memset(&msg, 0, sizeof(msg));
+				memcpy(&msg, data, MIN(length, sizeof(msg)));
+
+				
+				DPRINTF("\tbmHint = 0x%04X\n", le16_to_cpu(msg.bmHint));
+				DPRINTF("\tbFormatIndex = %d\n", msg.bFormatIndex);
+				DPRINTF("\tbFrameIndex = %d\n", msg.bFrameIndex);
+				DPRINTF("\tdwFrameInterval = 0x%08X\n", le32_to_cpu(msg.dwFrameInterval));
+				DPRINTF("\twKeyFrameRate = 0x%04X\n", le16_to_cpu(msg.wKeyFrameRate));
+				DPRINTF("\twPFrameRate = 0x%04X\n", le16_to_cpu(msg.wPFrameRate));
+				DPRINTF("\twCompQuality = 0x%04X\n", le16_to_cpu(msg.wCompQuality));
+				DPRINTF("\twCompWindowSize = 0x%04X\n", le16_to_cpu(msg.wCompWindowSize));
+				DPRINTF("\twDelay = 0x%04X\n", le16_to_cpu(msg.wDelay));
+				DPRINTF("\tdwMaxVideoFrameSize= 0x%08X\n", le32_to_cpu(msg.dwMaxVideoFrameSize));
+				DPRINTF("\tdwMaxPayloadTransferSize= 0x%08X\n", le32_to_cpu(msg.dwMaxPayloadTransferSize));
+				
+				
+				ret = 26;
+			}
+			else if((index&0xFF00) == 0x0400 && (value&0xFF00) == 0x0100) // Setting input
+			{
+				DPRINTF("Setting input to %d\n", data[0]);
+				if(length != 1)
+				{
+					DPRINTF("USB Request: Requested %d bytes, expected 1 byte\n", length);
+					goto fail;
+				}
+				
+				s->current_input = data[0];
+				ret = 1;
+			}
+			else if((index&0xFF00) == 0x0500 && (value&0xFF00) == 0x0200) // PU_BRIGHTNESS_CONTROL of PROCESSING_UNIT
+			{
+				DPRINTF("USB Resquest: Setting brightness\n");
+				if(length != 2)
+				{
+					DPRINTF("USB Request: Requested %d bytes, expected 2 bytes\n", length);
+					goto fail;
+				}
+
+
+				if (s->brightness.supported) {
+					int16_t brightness_field;
+					memcpy(&brightness_field, data, 2);
+					s->brightness.current_value = le16_to_cpu(brightness_field);
+				}
+				ret = 2;
+			}
+			else
+				goto fail;
+			break;
+		case UVCGetVideoControl | USB_UVC_GET_RES:
+			if((index&0xFF00) == 0x0500 && (value&0xFF00) == 0x0200) // PU_BRIGHTNESS_CONTROL of PROCESSING_UNIT
+			{
+				DPRINTF("USB Resquest: Asking for brightness resolution\n");
+				if(length != 2)
+				{
+					DPRINTF("USB Request: Requested %d bytes, expected 2 bytes\n", length);
+					goto fail;
+				}
+				
+				if (s->brightness.supported) {
+					printf("resolution value is %d\n", s->brightness.resolution);
+					int16_t for_writing = cpu_to_le16(s->brightness.resolution);
+					memcpy(data, &for_writing, 2);
+					ret = 2;
+				}
+				else {
+					data[0] = 1;
+					data[1] = 0;
+					ret = 2;
+				}
+			}
+			else
+				goto fail;
+			break;
+		case UVCGetVideoControl | USB_UVC_GET_INFO:
+			if(length != 1)
+			{
+				DPRINTF("USB Request: Requested %d bytes, expected 1 bytes\n", length);
+				goto fail;
+			}
+			if((index&0xFF00) == 0x0500 && (value&0xFF00) == 0x0200 && 0) // PU_BRIGHTNESS_CONTROL of PROCESSING_UNIT
+			{
+				data[0] = 0x3; //support GET & SET
+				ret = 1;
+			}
+			else {
+				data[0] = 0;
+				printf("reporting no support for index 0x%08x and value 0x%08x\n", index, value);
+				ret = 1;
+			}
+			break;
+		default:
+		fail:
+			DPRINTF("USB Request: Unhandled control request\n");
+			DPRINTF("\tRequest: 0x%08X\n", request);
+			DPRINTF("\tValue: 0x%08X\n", value);
+			DPRINTF("\tIndex: 0x%08X\n", index);
+			DPRINTF("\tLength: 0x%08X\n", length);
+			p->status = USB_RET_STALL;
+			return;
+    }
+	p->actual_length = ret;
+}
+
+static void usb_uvc_handle_data(USBDevice *dev, USBPacket *p)
+{
+	USBUVCState *s = DO_UPCAST(USBUVCState, dev, dev);
+	//DPRINTF("Data called\n");
+	//DPRINTF("Packet ID: %d\n", p->pid);
+	//DPRINTF("Device address: %d\n", p->devaddr);
+	//DPRINTF("Device endpoint: %d\n", p->ep->nr);
+	//DPRINTF("Data length: %d\n", p->len);
+	
+	switch (p->pid)
+	{
+		case USB_TOKEN_OUT:
+			DPRINTF("USB Data Out requested.\n");
+			break;
+		case USB_TOKEN_IN:
+			//printf("frame_remaining_bytes: %d\n", frame_remaining_bytes);
+			if(p->ep->nr == 1) // IN endpoint 1 (hardware button)
+			{
+				uint8_t buf[p->iov.size];
+				buf[0] = 2;
+				buf[1] = 1;
+				buf[2] = 0;
+				buf[3] = 0;
+				usb_packet_copy(p, buf, sizeof(buf));
+			}
+			else if(p->ep->nr == 2) // IN endpoint 2 (video data)
+			{
+				if(s->frame_remaining_bytes==0)
+				{
+					get_frame_read(s);
+				}
+				uint32_t len;
+				len = p->iov.size - p->actual_length;
+				//printf("iov has size %zu\n", len);
+				int to_copy = MIN(512, MIN(len, s->frame_remaining_bytes));
+				usb_packet_copy(p, s->frame, to_copy);
+				s->frame += to_copy;
+				s->frame_remaining_bytes -= to_copy;
+			}
+			else
+			{
+				DPRINTF("USB Data In requested.\n");
+				DPRINTF("Requested data from endpoint %02X\n", p->ep->nr);
+			}
+			break;
+	    default:
+			DPRINTF("Bad token: %d\n", p->pid);
+			//fail:
+			p->status = USB_RET_STALL;
+			break;
+    }
+	
+    return;
+}
+
+static void usb_uvc_unrealize(USBDevice *dev, Error **errp)
+{
+	USBUVCState *s = DO_UPCAST(USBUVCState, dev, dev);
+	DPRINTF("Unrealize called\n");
+	close(s->v4l2_fd);
+}
+
+
+
+
+
+
+uint8_t frame_descriptor[] = {
+	/* class-specific vs frame descriptor alternate 0 */
+	0x26,		/*	u8	bLength; */
+	0x24,		/*	u8	bDescriptorType; CS_INTERFACE */
+	0x07,		/*	u8	bDescriptorSubtype; VS_FRAME_MJPEG */
+	0x01,		/*	u8	bFrameIndex; */
+	0x01,		/*	u8	bmCapabilities; */
+	0x40, 0x01,	/*	u8	wWidth; 320 */
+	0xF0, 0x00,	/*	u8	wHeight; 240 */
+	0x00, 0xEC,
+	0x0D, 0x00,	/*	u32	dwMinBitRate; */
+	0x00, 0xEC,
+	0x0D, 0x00,	/*	u32	dwMaxBitRate; */
+	0x72, 0xCE,
+	0x00, 0x00,	/*	u32	dwMaxVideoFrameBufSize; */
+	0x2A, 0x2C,
+	0x0A, 0x00,	/*	u32	dwDefaultFrameInterval; */
+	0x00,		/*	u8	bFrameIntervalType;	*/
+	0x2A, 0x2C,
+	0x0A, 0x00,	/*	u32	dwMinFrameInterval; */
+	0x2A, 0x2C,
+	0x0A, 0x00,	/*	u32	dwMaxFrameInterval; */
+	0x00, 0x00,
+	0x00, 0x00,	/*	u32	dwFrameIntervalStep; */
+	};
+
+
+
+
+static int usb_uvc_try_userpointers_setup(USBUVCState *s)
+{
+struct v4l2_requestbuffers reqbuf;
+
+memset (&reqbuf, 0, sizeof (reqbuf));
+reqbuf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+reqbuf.memory = V4L2_MEMORY_USERPTR;
+reqbuf.count = 2;
+
+if (ioctl (s->v4l2_fd, VIDIOC_REQBUFS, &reqbuf) == -1) {
+    if (errno == EINVAL)
+        printf ("Video capturing or user pointer streaming is not supported\n");
+    else
+        perror ("VIDIOC_REQBUFS");
+
+    exit (EXIT_FAILURE);
+}
+
+
+	DPRINTF("Allocating memory for frames.\n");
+	s->frame_storage[0] = malloc(s->frame_max_length+2);
+	s->frame_storage[1] = malloc(s->frame_max_length+2);
+	s->frame_storage[2] = malloc(s->frame_max_length+2);
+
+
+
+
+        for (int i = 0; i < 2; ++i) {
+                struct v4l2_buffer buf;
+
+                memset(&buf,0,sizeof(buf));
+                buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+                buf.memory = V4L2_MEMORY_USERPTR;
+                buf.index = i;
+                buf.m.userptr = (unsigned long)s->frame_storage[i]+2;
+                buf.length = s->frame_max_length;
+
+
+			if (ioctl (s->v4l2_fd, VIDIOC_QBUF, &buf) == -1) {
+				perror ("VIDIOC_REQBUFS");
+			}
+        }
+
+	s->frame = s->frame_storage[2];
+
+
+
+	s->frame_start = s->frame;
+	s->frame_remaining_bytes = 0;
+	s->frame_id = 0;
+
+
+
+
+
+
+
+
+struct v4l2_streamparm parm;
+
+    parm.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+
+    parm.parm.capture.timeperframe.numerator = 1;
+    parm.parm.capture.timeperframe.denominator = 1;
+
+
+
+
+
+
+
+
+if (ioctl (s->v4l2_fd, VIDIOC_S_PARM, &parm) == -1) {
+    if (errno == EINVAL)
+        printf ("VIDIOC_S_PARM is not supported\\n");
+    else
+        perror ("VIDIOC_S_PARM");
+
+    exit (EXIT_FAILURE);
+}
+
+
+
+
+
+
+
+
+
+int cap_type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+if (ioctl (s->v4l2_fd, VIDIOC_STREAMON, &cap_type) == -1) {
+    if (errno == EINVAL)
+        printf ("VIDIOC_STREAMON is not supported\\n");
+    else
+        perror ("VIDIOC_STREAMON");
+
+    exit (EXIT_FAILURE);
+}
+
+	return 0;
+}
+
+
+
+
+
+static void usb_uvc_realize(USBDevice *dev, Error **errp)
+{
+	struct v4l2_capability capabilities;
+	struct v4l2_input video_input;
+	struct v4l2_format v_format;
+	int video_input_index;
+	int ret_err;
+	
+	DPRINTF("Init called\n");
+	
+	USBUVCState *s = DO_UPCAST(USBUVCState, dev, dev);
+
+	usb_desc_create_serial(dev);
+	usb_desc_init(dev);
+	
+	s->current_input = 0;
+	s->height = 240;
+	s->width = 320;
+
+
+
+	*(uint16_t*)&frame_descriptor[5] = s->width;
+	*(uint16_t*)&frame_descriptor[7] = s->height;
+	
+	if (!s->v4l2_device) {
+        error_setg(errp, "V4L2 device specification needed.");
+        return;
+    }
+	else
+	{
+		DPRINTF("Trying to open %s\n.", s->v4l2_device);
+	}
+	
+	s->v4l2_fd = open(s->v4l2_device, O_RDWR);
+	
+	if(s->v4l2_fd==-1)
+	{
+		switch(errno)
+		{
+			case EACCES:
+				error_report("Access denied.");
+				break;
+			case EBUSY:
+				error_report("Device busy.");
+				break;
+			case ENXIO:
+				error_report("Device does not exist.");
+				break;
+			case ENOMEM:
+				error_report("Not enough memory to open device.");
+				break;
+			case EMFILE:
+				error_report("Process reached maximum files opened.");
+				break;
+			case ENFILE:
+				error_report("System reached maximum files opened.");
+				break;
+			default:
+				error_report("Unknown error %d opening device.", errno);
+				break;
+		}
+		error_setg(errp, "V4L2 device open failed.");
+		return;
+	}
+	
+	DPRINTF("Device opened correctly.\n");
+	
+	DPRINTF("Querying capabilities.\n");
+	
+	ret_err = ioctl(s->v4l2_fd, VIDIOC_QUERYCAP, &capabilities);
+	
+	if(ret_err==-1)
+	{
+		switch(errno)
+		{
+			case EINVAL:
+				error_report("Device is not V4L2 device.\n");
+				break;
+			default:
+				error_report("Device returned unknown error %d.\n", errno);
+				break;
+		}
+		error_setg(errp, "V4L2 IOCTL VIDIOC_QUERYCAP failed");
+		return;
+	}
+	
+	DPRINTF("Device driver: %s\n", capabilities.driver);
+	DPRINTF("Device name: %s\n", capabilities.card);
+	DPRINTF("Device bus: %s\n", capabilities.bus_info);
+	DPRINTF("Driver version: %u.%u.%u\n",(capabilities.version >> 16) & 0xFF,(capabilities.version >> 8) & 0xFF,	capabilities.version & 0xFF);
+	DPRINTF("Device capabilities: 0x%08X\n", capabilities.capabilities);
+
+
+
+
+
+	
+	DPRINTF("Enumerating video inputs.\n");
+	memset(&video_input, 0, sizeof(video_input));
+	video_input.index=0;
+	while((ioctl(s->v4l2_fd, VIDIOC_ENUMINPUT, &video_input)==0))
+	{
+		if(video_input.type == V4L2_INPUT_TYPE_CAMERA)
+		{
+			video_input_index = video_input.index;
+			break;
+		}
+		
+		video_input.index++;
+	}
+	
+	DPRINTF("Setting video input to index %d\n", video_input_index);
+	ret_err = ioctl(s->v4l2_fd, VIDIOC_S_INPUT, &video_input_index);
+	
+	if(ret_err==-1)
+	{
+		switch(errno)
+		{
+			case EINVAL:
+				error_report("Incorrect video input selected.\n");
+				break;
+			case EBUSY:
+				error_report("Input cannot be switched.\n");
+				break;
+			default:
+				error_report("Unknown error %d.\n", errno);
+				break;
+		}
+		error_setg(errp, "V4L2 IOCTL VIDIOC_S_INPUT failed");
+		return;
+	}
+	
+	ioctl(s->v4l2_fd, VIDIOC_G_INPUT, &ret_err);
+	
+	if(ret_err==video_input_index)
+		DPRINTF("Video input correctly set.\n");
+	else
+	{
+		error_report("Some error happened while setting video input.\n");
+		error_setg(errp, "V4L2 IOCTL VIDIOC_G_INPUT failed");
+		return;
+	}
+	
+	DPRINTF("Trying to set %zux%zu MJPEG.\n", s->width, s->height);
+	memset(&v_format, 0, sizeof(v_format));
+	v_format.type                = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	v_format.fmt.pix.pixelformat = V4L2_PIX_FMT_MJPEG;
+
+
+	ret_err = ioctl (s->v4l2_fd, VIDIOC_G_FMT, &v_format);
+	if(ret_err == -1)
+	{
+		error_setg(errp, "V4L2 IOCTL VIDIOC_G_FMT failed %d", errno);
+		return;
+	}
+
+	v_format.type                = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	v_format.fmt.pix.width       = s->width; 
+	v_format.fmt.pix.height      = s->height;
+	v_format.fmt.pix.pixelformat = V4L2_PIX_FMT_MJPEG;
+	v_format.fmt.pix.field       = V4L2_FIELD_INTERLACED;
+	
+	ret_err = ioctl (s->v4l2_fd, VIDIOC_S_FMT, &v_format);
+	
+	if(ret_err == -1)
+	{
+		switch(errno)
+		{
+			case EBUSY:
+				error_report("Device busy while changing format.\n");
+				break;
+			case EINVAL:
+				error_report("Invalid format.\n");
+				break;
+			default:
+				error_report("Unknown error %d while changing format.\n", errno);
+				break;
+		}
+		error_setg(errp, "V4L2 IOCTL VIDIOC_S_FMT failed");
+		return;
+	}
+
+	s->frame_max_length = v_format.fmt.pix.sizeimage;
+	
+	DPRINTF("Format correctly set.\n");
+
+	printf("%d %d\n", v_format.fmt.pix.width , v_format.fmt.pix.height);
+	DPRINTF("Maximum image size: %d bytes.\n", s->frame_max_length);
+
+
+	struct v4l2_queryctrl queryctrl;
+	if (assign_query_control(s->v4l2_fd, V4L2_CID_BRIGHTNESS, &queryctrl) == 0) {
+		s->brightness.supported = true;
+		s->brightness.minimum = queryctrl.minimum;
+		s->brightness.maximum = queryctrl.maximum;
+		s->brightness.resolution = queryctrl.step;
+		s->brightness.default_value = queryctrl.default_value;
+	}
+
+
+
+
+
+
+	if (!s->v4l2_api && capabilities.capabilities & V4L2_CAP_READWRITE) {
+		printf("Device supports read/write\n");
+		s->frame_storage[0] = malloc(s->frame_max_length+2);
+		s->frame_storage[1] = NULL;
+		s->frame_storage[2] = NULL;
+		s->frame = s->frame_storage[0];
+		s->frame_start = s->frame;
+		s->frame_remaining_bytes = 0;
+		s->frame_id = 0;
+		s->v4l2_api = V4L2_API_READ;
+	}
+
+
+	if (!s->v4l2_api && capabilities.capabilities & V4L2_CAP_STREAMING) {
+		printf("Device supports V4L2_CAP_STREAMING\n");
+		int retval = usb_uvc_try_userpointers_setup(s);
+		if (retval == 0) {
+			printf("Selecting  V4L2_API_USERPTRS\n");
+			s->v4l2_api = V4L2_API_USERPTRS;
+		}
+	}
+
+
+	if (!s->v4l2_api) {
+		error_setg(errp, "No possible V4L2 API found.");
+		return;
+	}
+}
+
+
+enum usb_audio_strings {
+    STRING_NULL,
+    STRING_MANUFACTURER,
+    STRING_PRODUCT,
+    STRING_SERIALNUMBER,
+};
+
+static const USBDescStrings usb_uvc_stringtable = {
+    [STRING_MANUFACTURER]       = "QEMU",
+    [STRING_PRODUCT]            = "QEMU USB VIDEO CLASS 2",
+    [STRING_SERIALNUMBER]       = "1",
+};
+
+
+static const USBDescIface video_control_iface =
+
+{
+        .bInterfaceNumber              = 0,
+        .bNumEndpoints                 = 1,
+        .bInterfaceClass               = 0x0e,
+        .bInterfaceSubClass            = 0x01,
+        .bInterfaceProtocol            = 0x00,
+        .iInterface                    = 0x02,
+        .ndesc                         = 6,
+        .descs = (USBDescOther[]) {
+             {
+		.data = (uint8_t[]) {
+			/* class specific vc interface descriptor */
+			0x0D,		/*  u8  cif_bLength; */
+			0x24,		/*  u8  cif_bDescriptorType; CS_INTERFACE */
+			0x01,		/*  u8  cif_bDescriptorSubType; VC_HEADER */
+			0x00, 0x01, /*  u16 cif_bcdUVC; 1.0 */
+			0x42, 0x00, /*  u16 cif_wTotalLength */
+			0x80, 0x8D, /*  u32 cif_dwClockFrequency; Deprecated, 6Mhz */
+			0x5B, 0x00,
+			0x01,		/*  u8  cif_bInCollection; */
+			0x01,		/*  u8  cif_baInterfaceNr; */
+                }
+            },{
+                .data = (uint8_t[]) {
+	/* input terminal descriptor */
+			0x11,		/*  u8  itd_bLength; */
+			0x24,		/*  u8  itd_bDescriptorType; CS_INTERFACE */
+			0x02,		/*  u8  itd_bDescriptorSubtype; VC_INPUT_TERMINAL */
+			0x01,		/*  u8  itd_bTerminalID; */
+			0x01, 0x02, /*  u16  itd_wTerminalType; ITT_CAMERA */
+			0x00,		/*  u8  itd_bAssocTerminal; No association */
+			0x00,		/*  u8  itd_iTerminal; Unused */
+			0x00, 0x00, /*  u16  itd_wObjectiveFocalLengthMin; No optical zoom */
+			0x00, 0x00, /*  u16  itd_wObjectiveFocalLengthMax; No optical zoom */
+			0x00, 0x00, /*  u16  itd_wOcularFocalLength; No optical zoom */
+			0x02,		/*  u8  itd_bControlSize; No controls implemented */
+			0x00, 0x00, /*  u16  itd_bmControls; No controls supported */
+                }
+            },{
+                .data = (uint8_t[]) {
+		0x08,		/*	u8	itd_bLength; */
+		0x24,		/*	u8	itd_bDescriptorType; CS_INTERFACE */
+		0x02,		/*	u8	itd_bDescriptorSubtype; VC_INPUT_TERMINAL */
+		0x02,		/*	u8	itd_bTerminalID; */
+		0x01, 0x04,	/*	u16	itd_wTerminalType; ITT_COMPOSITE */
+		0x00,		/*	u8	itd_bAssocTerminal; */
+		0x00,		/*	u8	itd_iTerminal; */
+                }
+            },{
+                .data = (uint8_t[]) {
+		/* output terminal descriptor */
+		0x09,		/*	u8	otd_bLength; */
+		0x24,		/*	u8	otd_bDescriptorType; CS_INTERFACE */
+		0x03,		/*	u8	otd_bDescriptorSubtype; VC_OUTPUT_TERMINAL */
+		0x03,		/*	u8	otd_bTerminalID; */
+		0x01, 0x01,	/*	u16	otd_wTerminalType; TT_STREAMING */
+		0x00,		/*	u8	otd_bAssocTerminal; No association */
+		0x05,		/*	u8	otd_bSourceID; */
+		0x00,		/*	u8	otd_iTerminal; */
+                }
+            },{
+                .data = (uint8_t[]) {
+		/* selector unit descriptor */
+		0x08,		/*	u8	sud_bLength; */
+		0x24,		/*	u8	sud_bDescriptorType; CS_INTERFACE */
+		0x04,		/*	u8	sud_bDescriptorSubtype; VC_SELECTOR_UNIT */
+		0x04,		/*	u8	sud_bUnitID; */
+		0x02,		/*	u8	sud_bNrInPins; */
+		0x01,		/*	u8	sud_baSourceID; */
+		0x02,
+		0x00,		/*	u8	sud_iSelector; */
+                }
+            },{
+                .data = (uint8_t[]) {
+		/* processing unit descriptor */
+		0x0B,		/*	u8	pud_bLength; */
+		0x24,		/*	u8	pud_bDescriptorType; CS_INTERFACE */
+		0x05,		/*	u8	pud_bDescriptorSubtype; VC_PROCESSING_UNIT */
+		0x05,		/*	u8	pud_bUnitID; */
+		0x04,		/*	u8	pud_bSourceID; */
+		0x00, 0x00,	/*	u16	pud_wMaxMultiplier; */
+		0x02,		/*	u8	pud_bControlSize; */
+		0x01, 0x00,	/*	u16	pud_bmControls; Brightness control supported */
+		0x00,		/*	u8	pud_iProcessing; */
+		}
+            }
+         },
+
+        .eps = (USBDescEndpoint[]) {
+            {
+                /* standard interrupt endpoint */
+                .bEndpointAddress      = 0x81,
+                .bmAttributes          = 0x03,
+                .wMaxPacketSize        = 0x08,
+                .bInterval             = 0xff,
+            },
+        },
+        
+    };
+
+
+
+
+
+
+static const USBDescIface desc_iface_fullspeed[] = {
+    {
+         /* standard vs interface descriptor alternate 0 */
+        .bInterfaceNumber              = 1,
+        .bNumEndpoints                 = 1,
+        .bInterfaceClass               = 0x0e,
+        .bInterfaceSubClass            = 0x02,
+        .bInterfaceProtocol            = 0x00,
+        .iInterface                    = 0x00,
+        .ndesc                         = 3,
+        .descs = (USBDescOther[]) {
+             {
+		.data = (uint8_t[]) {
+		/* class-specific vs header descriptor input alternate 0 */
+		0x0E,		/*	u8	bLength; */
+		0x24,		/*	u8	bDescriptorType; CS_INTERFACE */
+		0x01,		/*	u8	bDescriptorSubtype; VS_INPUT_HEADER */
+		0x01,		/*	u8	bNumFormats; */
+		0x46, 0x00,	/*	u8	wTotalLength; */
+		0x82,		/*	u8	bEndpointAddress; */
+		0x00,		/*	u8	bmInfo; */
+		0x03,		/*	u8	bTerminalLink; */
+		0x00,		/*	u8	bStillCaptureMethod; */
+		0x00,		/*	u8	bTriggerSupport; */
+		0x00,		/*	u8	bTriggerUsage; */
+		0x01,		/*	u8	bControlSize; */
+		0x00,		/*	u8	bmaControls; */
+                }
+            },{
+                .data = (uint8_t[]) {
+		/* class-specific vs format descriptor alternate 0 */
+		0x0B,		/*	u8	bLength; */
+		0x24,		/*	u8	bDescriptorType; CS_INTERFACE */
+		0x06,		/*	u8	bDescriptorSubtype; VS_FORMAT_MJPEG */
+		0x01,		/*	u8	bFormatIndex; */
+		0x01,		/*	u8	bNumFrameDescriptors; */
+		0x01,		/*	u8	bmFlags; */
+		0x01,		/*	u8	bDefaultFrameIndex; */
+		0x00,		/*	u8	bAspectRatioX; */
+		0x00,		/*	u8	bAspectRatioY; */
+		0x02,		/*	u8	bmInterlaceFlags; */
+		0x00,		/*	u8	bCopyProtect; */
+                }
+            },{
+                .data = frame_descriptor
+            }
+         },
+
+        .eps = (USBDescEndpoint[]) {
+            {
+                /* standard vs isochronous video data endpoint descriptor */
+                .bEndpointAddress      = 0x82,
+                .bmAttributes          = 0x02,
+                .wMaxPacketSize        = 0x40,
+                .bInterval             = 0xff,
+            },
+        },
+    },
+    
+};
+
+
+
+
+static const USBDescIface desc_iface_highspeed[] = {
+    {
+         /* standard vs interface descriptor alternate 0 */
+        .bInterfaceNumber              = 1,
+        .bNumEndpoints                 = 1,
+        .bInterfaceClass               = 0x0e,
+        .bInterfaceSubClass            = 0x02,
+        .bInterfaceProtocol            = 0x00,
+        .iInterface                    = 0x00,
+        .ndesc                         = 3,
+        .descs = (USBDescOther[]) {
+             {
+		.data = (uint8_t[]) {
+		/* class-specific vs header descriptor input alternate 0 */
+		0x0E,		/*	u8	bLength; */
+		0x24,		/*	u8	bDescriptorType; CS_INTERFACE */
+		0x01,		/*	u8	bDescriptorSubtype; VS_INPUT_HEADER */
+		0x01,		/*	u8	bNumFormats; */
+		0x46, 0x00,	/*	u8	wTotalLength; */
+		0x82,		/*	u8	bEndpointAddress; */
+		0x00,		/*	u8	bmInfo; */
+		0x03,		/*	u8	bTerminalLink; */
+		0x00,		/*	u8	bStillCaptureMethod; */
+		0x00,		/*	u8	bTriggerSupport; */
+		0x00,		/*	u8	bTriggerUsage; */
+		0x01,		/*	u8	bControlSize; */
+		0x00,		/*	u8	bmaControls; */
+                }
+            },{
+                .data = (uint8_t[]) {
+		/* class-specific vs format descriptor alternate 0 */
+		0x0B,		/*	u8	bLength; */
+		0x24,		/*	u8	bDescriptorType; CS_INTERFACE */
+		0x06,		/*	u8	bDescriptorSubtype; VS_FORMAT_MJPEG */
+		0x01,		/*	u8	bFormatIndex; */
+		0x01,		/*	u8	bNumFrameDescriptors; */
+		0x01,		/*	u8	bmFlags; */
+		0x01,		/*	u8	bDefaultFrameIndex; */
+		0x00,		/*	u8	bAspectRatioX; */
+		0x00,		/*	u8	bAspectRatioY; */
+		0x02,		/*	u8	bmInterlaceFlags; */
+		0x00,		/*	u8	bCopyProtect; */
+                }
+            },{
+                .data = frame_descriptor
+            }
+         },
+
+        .eps = (USBDescEndpoint[]) {
+            {
+                /* standard vs isochronous video data endpoint descriptor */
+                .bEndpointAddress      = 0x82,
+                .bmAttributes          = USB_ENDPOINT_XFER_BULK,
+                .wMaxPacketSize        = 512,
+                .bInterval             = 0xff,
+            },
+        },
+    },
+    
+};
+
+
+
+
+
+static const USBDescIfaceAssoc desc_iface_groups[] = {
+  {
+/* interface association */
+    .bFirstInterface = 0x00,
+    .bInterfaceCount = 0x02,
+    .bFunctionClass = 0x0e,
+    .bFunctionSubClass = 0x03,
+    .bFunctionProtocol = 0x00,
+    .iFunction = 0x02,
+    .nif = 1,
+    .ifs = &video_control_iface,
+
+
+  },
+};
+
+
+static const USBDescDevice desc_device_highspeed = {
+    .bcdUSB                        = 0x0200,
+    .bMaxPacketSize0               = 64,
+    .bNumConfigurations            = 1,
+    .confs = (USBDescConfig[]) {
+        {
+            .bNumInterfaces        = 2,
+            .bConfigurationValue   = 1,
+            .iConfiguration        = 0,
+            .bmAttributes          = 0x80,
+            .bMaxPower             = 0xfa,
+            .nif_groups = ARRAY_SIZE(desc_iface_groups),
+            .if_groups = desc_iface_groups,
+            .nif = ARRAY_SIZE(desc_iface_highspeed),
+            .ifs = desc_iface_highspeed,
+        },
+    },
+};
+
+static const USBDescDevice desc_device_fullspeed = {
+    .bcdUSB                        = 0x0110,
+    .bMaxPacketSize0               = 64,
+    .bNumConfigurations            = 1,
+    .confs = (USBDescConfig[]) {
+        {
+            .bNumInterfaces        = 2,
+            .bConfigurationValue   = 1,
+            .iConfiguration        = 0,
+            .bmAttributes          = 0x80,
+            .bMaxPower             = 0xfa,
+            .nif_groups = ARRAY_SIZE(desc_iface_groups),
+            .if_groups = desc_iface_groups,
+            .nif = ARRAY_SIZE(desc_iface_fullspeed),
+            .ifs = desc_iface_fullspeed,
+        },
+    },
+};
+
+static const USBDesc desc_uvc = {
+    .id = {
+        .idVendor          = 0,
+        .idProduct         = 0,
+        .bcdDevice         = 0,
+        .iManufacturer     = STRING_MANUFACTURER,
+        .iProduct          = STRING_PRODUCT,
+        .iSerialNumber     = STRING_SERIALNUMBER,
+    },
+    .full = &desc_device_fullspeed,
+    //.high = &desc_device_highspeed,
+    .str  = usb_uvc_stringtable,
+};
+
+
+
+static Property usb_uvc_properties[] = {
+    DEFINE_PROP_STRING("device", USBUVCState, v4l2_device),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void usb_uvc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    USBDeviceClass *k = USB_DEVICE_CLASS(klass);
+
+    dc->props         = usb_uvc_properties;
+    k->product_desc   = "QEMU USB Video Class Device";
+    k->usb_desc       = &desc_uvc;
+    k->realize        = usb_uvc_realize;
+    k->handle_reset   = usb_uvc_handle_reset;
+    k->handle_control = usb_uvc_handle_control;
+    k->handle_data    = usb_uvc_handle_data;
+    k->unrealize      = usb_uvc_unrealize;
+}
+
+static TypeInfo usb_uvc_info = {
+    .name          = "usb-uvc-webcam",
+    .parent        = TYPE_USB_DEVICE,
+    .instance_size = sizeof(USBUVCState),
+    .class_init    = usb_uvc_class_init,
+};
+
+static void usb_uvc_register_types(void)
+{
+    type_register_static(&usb_uvc_info);
+}
+
+type_init(usb_uvc_register_types)
-- 
2.17.1


