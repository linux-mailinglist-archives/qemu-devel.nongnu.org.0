Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C792C46FF62
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 12:05:35 +0100 (CET)
Received: from localhost ([::1]:44462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvdiY-0004Fm-BP
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 06:05:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mvdfV-0002oL-I7
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 06:02:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mvdfT-00037w-3V
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 06:02:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639134138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VlnIqmJN2y1+QHZjUfdBdkx87KtPuP2MN2zzjGG1ozY=;
 b=Z2pALY5uLbq6D7e+Tv2z757bA9UIXAexEPoYj3bYSKLyuwbLkAuExjcEF3TLbwQ6nQnMkN
 C2+oqs0zTZUebePtV94/PejkpIpb4aOdwdd8/h3AttsN0JQ3D/cDCJQAUfxuQqd1/POpqQ
 phaFPrdqPZRhBk5D9Ml4DutoZZTlmyo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596--VvKRGhXNPOaqIuaUayysQ-1; Fri, 10 Dec 2021 06:02:17 -0500
X-MC-Unique: -VvKRGhXNPOaqIuaUayysQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 b1-20020a5d6341000000b001901ddd352eso2148025wrw.7
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 03:02:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VlnIqmJN2y1+QHZjUfdBdkx87KtPuP2MN2zzjGG1ozY=;
 b=t8B2MWem5gDOQuMY1Yfj3YtTSAnkCzFD9pMjXX30z6+1bMirQkBewydZZedutaIUkz
 TvL4lGC147QGtqAsh/yrtzJpkGwxx0CnIMIP7tp0hPtqU5bM0b3ubfC+xqizjCjaDwoY
 oqPNXqhuulxFiMvEOyobAaPZ7OauzUidq10bWTPelUnRC4H0oJAoqF5wbZqbtxV0TzKj
 EzBoLkkYLxw898rPsuJIjWNM9bzb8kC2zqbmpyovQX8fSSYacgnlCYGQsftO0m8OM30U
 /Rw+P+xJkMmMU2kO6/y03SP1K1j+vxyyfzgNUcnzGwEfpLDz6W6HRc8LQxvedzIX7JOK
 uBMA==
X-Gm-Message-State: AOAM533LrUcgTjQdfg1i3wG3e/RiIio7kkZuDY4hdKpsvCz647VSGgrA
 FKZf1ZcGeGStSsJnu/tqiIsrIfwFGf+jkES1gAgTpZCXloO7YwA9b1wMX2e3KzrQb9U8tJ2zC5a
 7ohweWTAQT0SMizU=
X-Received: by 2002:a05:600c:501f:: with SMTP id
 n31mr15452199wmr.101.1639134136022; 
 Fri, 10 Dec 2021 03:02:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/iCDHtF8oE+F9HwSq1MQLjLQwMeBIWg/XvgnkTL1wSxmmQeKN+lu96pBgKb40YY6Q/ooGIg==
X-Received: by 2002:a05:600c:501f:: with SMTP id
 n31mr15452160wmr.101.1639134135648; 
 Fri, 10 Dec 2021 03:02:15 -0800 (PST)
Received: from redhat.com ([2.55.18.120])
 by smtp.gmail.com with ESMTPSA id d6sm2225443wrn.53.2021.12.10.03.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 03:02:15 -0800 (PST)
Date: Fri, 10 Dec 2021 06:02:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 5/8] standard-headers: Add virtio_video.h
Message-ID: <20211210055840-mutt-send-email-mst@kernel.org>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20211209145601.331477-6-peter.griffin@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211209145601.331477-6-peter.griffin@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marcandre.lureau@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 09, 2021 at 02:55:58PM +0000, Peter Griffin wrote:
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  include/standard-headers/linux/virtio_video.h | 483 ++++++++++++++++++
>  1 file changed, 483 insertions(+)
>  create mode 100644 include/standard-headers/linux/virtio_video.h
> 
> diff --git a/include/standard-headers/linux/virtio_video.h b/include/standard-headers/linux/virtio_video.h
> new file mode 100644
> index 0000000000..16b5f642a9
> --- /dev/null
> +++ b/include/standard-headers/linux/virtio_video.h
> @@ -0,0 +1,483 @@
> +/* SPDX-License-Identifier: BSD-3-Clause */
> +/*
> + * Virtio Video Device
> + *
> + * This header is BSD licensed so anyone can use the definitions
> + * to implement compatible drivers/servers:
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions
> + * are met:
> + * 1. Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer.
> + * 2. Redistributions in binary form must reproduce the above copyright
> + *    notice, this list of conditions and the following disclaimer in the
> + *    documentation and/or other materials provided with the distribution.
> + * 3. Neither the name of IBM nor the names of its contributors
> + *    may be used to endorse or promote products derived from this software
> + *    without specific prior written permission.
> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> + * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> + * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
> + * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL IBM OR
> + * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> + * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> + * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
> + * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
> + * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
> + * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
> + * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> + * SUCH DAMAGE.
> + *
> + * Copyright (C) 2019 OpenSynergy GmbH.
> + */
> +
> +#ifndef _UAPI_LINUX_VIRTIO_VIDEO_H
> +#define _UAPI_LINUX_VIRTIO_VIDEO_H
> +
> +#include <linux/types.h>
> +#include <linux/virtio_config.h>
> +
> +/*
> + * Feature bits
> + */
> +
> +/* Guest pages can be used for video buffers. */
> +#define VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES 0
> +/*
> + * The host can process buffers even if they are non-contiguous memory such as
> + * scatter-gather lists.
> + */
> +#define VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG 1
> +/* Objects exported by another virtio device can be used for video buffers */
> +#define VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT 2
> +
> +/*
> + * Image formats
> + */
> +
> +enum virtio_video_format {
> +	/* Raw formats */
> +	VIRTIO_VIDEO_FORMAT_RAW_MIN = 1,
> +	VIRTIO_VIDEO_FORMAT_ARGB8888 = VIRTIO_VIDEO_FORMAT_RAW_MIN,
> +	VIRTIO_VIDEO_FORMAT_BGRA8888,
> +	VIRTIO_VIDEO_FORMAT_NV12, /* 12  Y/CbCr 4:2:0  */
> +	VIRTIO_VIDEO_FORMAT_YUV420, /* 12  YUV 4:2:0     */
> +	VIRTIO_VIDEO_FORMAT_YVU420, /* 12  YVU 4:2:0     */
> +	VIRTIO_VIDEO_FORMAT_RAW_MAX = VIRTIO_VIDEO_FORMAT_YVU420,
> +
> +	/* Coded formats */
> +	VIRTIO_VIDEO_FORMAT_CODED_MIN = 0x1000,
> +	VIRTIO_VIDEO_FORMAT_MPEG2 =
> +		VIRTIO_VIDEO_FORMAT_CODED_MIN, /* MPEG-2 Part 2 */
> +	VIRTIO_VIDEO_FORMAT_MPEG4, /* MPEG-4 Part 2 */
> +	VIRTIO_VIDEO_FORMAT_H264, /* H.264 */
> +	VIRTIO_VIDEO_FORMAT_HEVC, /* HEVC aka H.265*/
> +	VIRTIO_VIDEO_FORMAT_VP8, /* VP8 */
> +	VIRTIO_VIDEO_FORMAT_VP9, /* VP9 */


Explicitly giving values for all constants is a good idea.
It's not a thing where the numbers don't matter as long as
they are all different. Same for the rest of enums.
I also wonder about the value of min/max here.


> +	VIRTIO_VIDEO_FORMAT_CODED_MAX = VIRTIO_VIDEO_FORMAT_VP9,
> +};
> +
> +enum virtio_video_profile {
> +	/* H.264 */
> +	VIRTIO_VIDEO_PROFILE_H264_MIN = 0x100,
> +	VIRTIO_VIDEO_PROFILE_H264_BASELINE = VIRTIO_VIDEO_PROFILE_H264_MIN,
> +	VIRTIO_VIDEO_PROFILE_H264_MAIN,
> +	VIRTIO_VIDEO_PROFILE_H264_EXTENDED,
> +	VIRTIO_VIDEO_PROFILE_H264_HIGH,
> +	VIRTIO_VIDEO_PROFILE_H264_HIGH10PROFILE,
> +	VIRTIO_VIDEO_PROFILE_H264_HIGH422PROFILE,
> +	VIRTIO_VIDEO_PROFILE_H264_HIGH444PREDICTIVEPROFILE,
> +	VIRTIO_VIDEO_PROFILE_H264_SCALABLEBASELINE,
> +	VIRTIO_VIDEO_PROFILE_H264_SCALABLEHIGH,
> +	VIRTIO_VIDEO_PROFILE_H264_STEREOHIGH,
> +	VIRTIO_VIDEO_PROFILE_H264_MULTIVIEWHIGH,
> +	VIRTIO_VIDEO_PROFILE_H264_MAX = VIRTIO_VIDEO_PROFILE_H264_MULTIVIEWHIGH,
> +
> +	/* HEVC */
> +	VIRTIO_VIDEO_PROFILE_HEVC_MIN = 0x200,
> +	VIRTIO_VIDEO_PROFILE_HEVC_MAIN = VIRTIO_VIDEO_PROFILE_HEVC_MIN,
> +	VIRTIO_VIDEO_PROFILE_HEVC_MAIN10,
> +	VIRTIO_VIDEO_PROFILE_HEVC_MAIN_STILL_PICTURE,
> +	VIRTIO_VIDEO_PROFILE_HEVC_MAX =
> +		VIRTIO_VIDEO_PROFILE_HEVC_MAIN_STILL_PICTURE,
> +
> +	/* VP8 */
> +	VIRTIO_VIDEO_PROFILE_VP8_MIN = 0x300,
> +	VIRTIO_VIDEO_PROFILE_VP8_PROFILE0 = VIRTIO_VIDEO_PROFILE_VP8_MIN,
> +	VIRTIO_VIDEO_PROFILE_VP8_PROFILE1,
> +	VIRTIO_VIDEO_PROFILE_VP8_PROFILE2,
> +	VIRTIO_VIDEO_PROFILE_VP8_PROFILE3,
> +	VIRTIO_VIDEO_PROFILE_VP8_MAX = VIRTIO_VIDEO_PROFILE_VP8_PROFILE3,
> +
> +	/* VP9 */
> +	VIRTIO_VIDEO_PROFILE_VP9_MIN = 0x400,
> +	VIRTIO_VIDEO_PROFILE_VP9_PROFILE0 = VIRTIO_VIDEO_PROFILE_VP9_MIN,
> +	VIRTIO_VIDEO_PROFILE_VP9_PROFILE1,
> +	VIRTIO_VIDEO_PROFILE_VP9_PROFILE2,
> +	VIRTIO_VIDEO_PROFILE_VP9_PROFILE3,
> +	VIRTIO_VIDEO_PROFILE_VP9_MAX = VIRTIO_VIDEO_PROFILE_VP9_PROFILE3,
> +};
> +
> +enum virtio_video_level {
> +	/* H.264 */
> +	VIRTIO_VIDEO_LEVEL_H264_MIN = 0x100,
> +	VIRTIO_VIDEO_LEVEL_H264_1_0 = VIRTIO_VIDEO_LEVEL_H264_MIN,
> +	VIRTIO_VIDEO_LEVEL_H264_1_1,
> +	VIRTIO_VIDEO_LEVEL_H264_1_2,
> +	VIRTIO_VIDEO_LEVEL_H264_1_3,
> +	VIRTIO_VIDEO_LEVEL_H264_2_0,
> +	VIRTIO_VIDEO_LEVEL_H264_2_1,
> +	VIRTIO_VIDEO_LEVEL_H264_2_2,
> +	VIRTIO_VIDEO_LEVEL_H264_3_0,
> +	VIRTIO_VIDEO_LEVEL_H264_3_1,
> +	VIRTIO_VIDEO_LEVEL_H264_3_2,
> +	VIRTIO_VIDEO_LEVEL_H264_4_0,
> +	VIRTIO_VIDEO_LEVEL_H264_4_1,
> +	VIRTIO_VIDEO_LEVEL_H264_4_2,
> +	VIRTIO_VIDEO_LEVEL_H264_5_0,
> +	VIRTIO_VIDEO_LEVEL_H264_5_1,
> +	VIRTIO_VIDEO_LEVEL_H264_MAX = VIRTIO_VIDEO_LEVEL_H264_5_1,
> +};
> +
> +/*
> + * Config
> + */
> +
> +struct virtio_video_config {
> +	__le32 version;
> +	__le32 max_caps_length;
> +	__le32 max_resp_length;
> +};
> +
> +/*
> + * Commands
> + */
> +
> +enum virtio_video_cmd_type {
> +	/* Command */
> +	VIRTIO_VIDEO_CMD_QUERY_CAPABILITY = 0x0100,
> +	VIRTIO_VIDEO_CMD_STREAM_CREATE,
> +	VIRTIO_VIDEO_CMD_STREAM_DESTROY,
> +	VIRTIO_VIDEO_CMD_STREAM_DRAIN,
> +	VIRTIO_VIDEO_CMD_RESOURCE_CREATE,
> +	VIRTIO_VIDEO_CMD_RESOURCE_QUEUE,
> +	VIRTIO_VIDEO_CMD_RESOURCE_DESTROY_ALL,
> +	VIRTIO_VIDEO_CMD_QUEUE_CLEAR,
> +	VIRTIO_VIDEO_CMD_GET_PARAMS,
> +	VIRTIO_VIDEO_CMD_SET_PARAMS,
> +	VIRTIO_VIDEO_CMD_QUERY_CONTROL,
> +	VIRTIO_VIDEO_CMD_GET_CONTROL,
> +	VIRTIO_VIDEO_CMD_SET_CONTROL,
> +
> +	/* Response */
> +	VIRTIO_VIDEO_RESP_OK_NODATA = 0x0200,
> +	VIRTIO_VIDEO_RESP_OK_QUERY_CAPABILITY,
> +	VIRTIO_VIDEO_RESP_OK_RESOURCE_QUEUE,
> +	VIRTIO_VIDEO_RESP_OK_GET_PARAMS,
> +	VIRTIO_VIDEO_RESP_OK_QUERY_CONTROL,
> +	VIRTIO_VIDEO_RESP_OK_GET_CONTROL,
> +
> +	VIRTIO_VIDEO_RESP_ERR_INVALID_OPERATION = 0x0300,
> +	VIRTIO_VIDEO_RESP_ERR_OUT_OF_MEMORY,
> +	VIRTIO_VIDEO_RESP_ERR_INVALID_STREAM_ID,
> +	VIRTIO_VIDEO_RESP_ERR_INVALID_RESOURCE_ID,
> +	VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER,
> +	VIRTIO_VIDEO_RESP_ERR_UNSUPPORTED_CONTROL,
> +};
> +
> +struct virtio_video_cmd_hdr {
> +	__le32 type; /* One of enum virtio_video_cmd_type */
> +	__le32 stream_id;
> +};
> +
> +/* VIRTIO_VIDEO_CMD_QUERY_CAPABILITY */
> +enum virtio_video_queue_type {
> +	VIRTIO_VIDEO_QUEUE_TYPE_INPUT = 0x100,
> +	VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT,
> +};
> +
> +struct virtio_video_query_capability {
> +	struct virtio_video_cmd_hdr hdr;
> +	__le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
> +	__u8 padding[4];
> +};
> +
> +enum virtio_video_planes_layout_flag {
> +	VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER = 1 << 0,
> +	VIRTIO_VIDEO_PLANES_LAYOUT_PER_PLANE = 1 << 1,
> +};
> +
> +struct virtio_video_format_range {
> +	__le32 min;
> +	__le32 max;
> +	__le32 step;
> +	__u8 padding[4];
> +};
> +
> +struct virtio_video_format_frame {
> +	struct virtio_video_format_range width;
> +	struct virtio_video_format_range height;
> +	__le32 num_rates;
> +	__u8 padding[4];
> +	/* Followed by struct virtio_video_format_range frame_rates[] */


You can actually do struct virtio_video_format_range frame_rates[]
with the same effect.

> +};
> +
> +struct virtio_video_format_desc {
> +	__le64 mask;
> +	__le32 format; /* One of VIRTIO_VIDEO_FORMAT_* types */
> +	__le32 planes_layout; /* Bitmask with VIRTIO_VIDEO_PLANES_LAYOUT_* */
> +	__le32 plane_align;
> +	__le32 num_frames;
> +	/* Followed by struct virtio_video_format_frame frames[] */
> +};
> +
> +struct virtio_video_query_capability_resp {
> +	struct virtio_video_cmd_hdr hdr;
> +	__le32 num_descs;
> +	__u8 padding[4];
> +	/* Followed by struct virtio_video_format_desc descs[] */
> +};
> +
> +/* VIRTIO_VIDEO_CMD_STREAM_CREATE */
> +enum virtio_video_mem_type {
> +	VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES,
> +	VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT,
> +};
> +
> +struct virtio_video_stream_create {
> +	struct virtio_video_cmd_hdr hdr;
> +	__le32 in_mem_type; /* One of VIRTIO_VIDEO_MEM_TYPE_* types */
> +	__le32 out_mem_type; /* One of VIRTIO_VIDEO_MEM_TYPE_* types */
> +	__le32 coded_format; /* One of VIRTIO_VIDEO_FORMAT_* types */
> +	__u8 padding[4];
> +	__u8 tag[64];
> +};
> +
> +/* VIRTIO_VIDEO_CMD_STREAM_DESTROY */
> +struct virtio_video_stream_destroy {
> +	struct virtio_video_cmd_hdr hdr;
> +};
> +
> +/* VIRTIO_VIDEO_CMD_STREAM_DRAIN */
> +struct virtio_video_stream_drain {
> +	struct virtio_video_cmd_hdr hdr;
> +};
> +
> +/* VIRTIO_VIDEO_CMD_RESOURCE_CREATE */
> +struct virtio_video_mem_entry {
> +	__le64 addr;
> +	__le32 length;
> +	__u8 padding[4];
> +};
> +
> +struct virtio_video_object_entry {
> +	__u8 uuid[16];
> +};
> +
> +#define VIRTIO_VIDEO_MAX_PLANES 8
> +
> +struct virtio_video_resource_create {
> +	struct virtio_video_cmd_hdr hdr;
> +	__le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
> +	__le32 resource_id;
> +	__le32 planes_layout;
> +	__le32 num_planes;
> +	__le32 plane_offsets[VIRTIO_VIDEO_MAX_PLANES];
> +	__le32 num_entries[VIRTIO_VIDEO_MAX_PLANES];
> +	/**
> +	 * Followed by either
> +	 * - struct virtio_video_mem_entry entries[]
> +	 *   for VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES
> +	 * - struct virtio_video_object_entry entries[]
> +	 *   for VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT
> +	 */
> +};
> +
> +/* VIRTIO_VIDEO_CMD_RESOURCE_QUEUE */
> +struct virtio_video_resource_queue {
> +	struct virtio_video_cmd_hdr hdr;
> +	__le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
> +	__le32 resource_id;
> +	__le64 timestamp;
> +	__le32 num_data_sizes;
> +	__le32 data_sizes[VIRTIO_VIDEO_MAX_PLANES];
> +	__u8 padding[4];
> +};
> +
> +enum virtio_video_buffer_flag {
> +	VIRTIO_VIDEO_BUFFER_FLAG_ERR = 0x0001,
> +	VIRTIO_VIDEO_BUFFER_FLAG_EOS = 0x0002,
> +
> +	/* Encoder only */
> +	VIRTIO_VIDEO_BUFFER_FLAG_IFRAME = 0x0004,
> +	VIRTIO_VIDEO_BUFFER_FLAG_PFRAME = 0x0008,
> +	VIRTIO_VIDEO_BUFFER_FLAG_BFRAME = 0x0010,
> +};
> +
> +struct virtio_video_resource_queue_resp {
> +	struct virtio_video_cmd_hdr hdr;
> +	__le64 timestamp;
> +	__le32 flags; /* One of VIRTIO_VIDEO_BUFFER_FLAG_* flags */
> +	__le32 size; /* Encoded size */
> +};
> +
> +/* VIRTIO_VIDEO_CMD_RESOURCE_DESTROY_ALL */
> +struct virtio_video_resource_destroy_all {
> +	struct virtio_video_cmd_hdr hdr;
> +	__le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
> +	__u8 padding[4];
> +};
> +
> +/* VIRTIO_VIDEO_CMD_QUEUE_CLEAR */
> +struct virtio_video_queue_clear {
> +	struct virtio_video_cmd_hdr hdr;
> +	__le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
> +	__u8 padding[4];
> +};
> +
> +/* VIRTIO_VIDEO_CMD_GET_PARAMS */
> +struct virtio_video_plane_format {
> +	__le32 plane_size;
> +	__le32 stride;
> +};
> +
> +struct virtio_video_crop {
> +	__le32 left;
> +	__le32 top;
> +	__le32 width;
> +	__le32 height;
> +};
> +
> +struct virtio_video_params {
> +	__le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
> +	__le32 format; /* One of VIRTIO_VIDEO_FORMAT_* types */
> +	__le32 frame_width;
> +	__le32 frame_height;
> +	__le32 min_buffers;
> +	__le32 max_buffers;
> +	struct virtio_video_crop crop;
> +	__le32 frame_rate;
> +	__le32 num_planes;
> +	struct virtio_video_plane_format plane_formats[VIRTIO_VIDEO_MAX_PLANES];
> +};
> +
> +struct virtio_video_get_params {
> +	struct virtio_video_cmd_hdr hdr;
> +	__le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
> +	__u8 padding[4];
> +};
> +
> +struct virtio_video_get_params_resp {
> +	struct virtio_video_cmd_hdr hdr;
> +	struct virtio_video_params params;
> +};
> +
> +/* VIRTIO_VIDEO_CMD_SET_PARAMS */
> +struct virtio_video_set_params {
> +	struct virtio_video_cmd_hdr hdr;
> +	struct virtio_video_params params;
> +};
> +
> +/* VIRTIO_VIDEO_CMD_QUERY_CONTROL */
> +enum virtio_video_control_type {
> +	VIRTIO_VIDEO_CONTROL_BITRATE = 1,
> +	VIRTIO_VIDEO_CONTROL_PROFILE,
> +	VIRTIO_VIDEO_CONTROL_LEVEL,
> +	VIRTIO_VIDEO_CONTROL_FORCE_KEYFRAME,
> +};
> +
> +struct virtio_video_query_control_profile {
> +	__le32 format; /* One of VIRTIO_VIDEO_FORMAT_* */
> +	__u8 padding[4];
> +};
> +
> +struct virtio_video_query_control_level {
> +	__le32 format; /* One of VIRTIO_VIDEO_FORMAT_* */
> +	__u8 padding[4];
> +};
> +
> +struct virtio_video_query_control {
> +	struct virtio_video_cmd_hdr hdr;
> +	__le32 control; /* One of VIRTIO_VIDEO_CONTROL_* types */
> +	__u8 padding[4];
> +	/*
> +	 * Followed by a value of struct virtio_video_query_control_*
> +	 * in accordance with the value of control.
> +	 */
> +};
> +
> +struct virtio_video_query_control_resp_profile {
> +	__le32 num;
> +	__u8 padding[4];
> +	/* Followed by an array le32 profiles[] */
> +};
> +
> +struct virtio_video_query_control_resp_level {
> +	__le32 num;
> +	__u8 padding[4];
> +	/* Followed by an array le32 level[] */
> +};
> +
> +struct virtio_video_query_control_resp {
> +	struct virtio_video_cmd_hdr hdr;
> +	/* Followed by one of struct virtio_video_query_control_resp_* */
> +};
> +
> +/* VIRTIO_VIDEO_CMD_GET_CONTROL */
> +struct virtio_video_get_control {
> +	struct virtio_video_cmd_hdr hdr;
> +	__le32 control; /* One of VIRTIO_VIDEO_CONTROL_* types */
> +	__u8 padding[4];
> +};
> +
> +struct virtio_video_control_val_bitrate {
> +	__le32 bitrate;
> +	__u8 padding[4];
> +};
> +
> +struct virtio_video_control_val_profile {
> +	__le32 profile;
> +	__u8 padding[4];
> +};
> +
> +struct virtio_video_control_val_level {
> +	__le32 level;
> +	__u8 padding[4];
> +};
> +
> +struct virtio_video_get_control_resp {
> +	struct virtio_video_cmd_hdr hdr;
> +	/* Followed by one of struct virtio_video_control_val_* */
> +};
> +
> +/* VIRTIO_VIDEO_CMD_SET_CONTROL */
> +struct virtio_video_set_control {
> +	struct virtio_video_cmd_hdr hdr;
> +	__le32 control; /* One of VIRTIO_VIDEO_CONTROL_* types */
> +	__u8 padding[4];
> +	/* Followed by one of struct virtio_video_control_val_* */
> +};
> +
> +struct virtio_video_set_control_resp {
> +	struct virtio_video_cmd_hdr hdr;
> +};
> +
> +/*
> + * Events
> + */
> +
> +enum virtio_video_event_type {
> +	/* For all devices */
> +	VIRTIO_VIDEO_EVENT_ERROR = 0x0100,
> +
> +	/* For decoder only */
> +	VIRTIO_VIDEO_EVENT_DECODER_RESOLUTION_CHANGED = 0x0200,
> +};
> +
> +struct virtio_video_event {
> +	__le32 event_type; /* One of VIRTIO_VIDEO_EVENT_* types */
> +	__le32 stream_id;
> +};
> +
> +#endif /* _UAPI_LINUX_VIRTIO_VIDEO_H */
> -- 
> 2.25.1


