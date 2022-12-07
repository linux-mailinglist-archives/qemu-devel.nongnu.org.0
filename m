Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E85B86463DF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 23:07:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p32Yc-0007wf-Bd; Wed, 07 Dec 2022 17:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p32Ya-0007wR-8w
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 17:06:24 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p32YY-0002Fk-3O
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 17:06:24 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 v19-20020a9d5a13000000b0066e82a3872dso10138771oth.5
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 14:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=DEhHTsEmiiqH++K1yF6RsVx2oxwAvUspDpHpkLQdk/E=;
 b=Kj5KqpwTEO1I1DzqMvG3z5fIQ0qhKRA3goJhd5Dq/jtp5qE4AJNG848EWPyaaLKuZV
 lFFQDnv/xr6FmMTIFCcd8b4CwLuxLbbZhcj+msyubp4mMl541LIs9wwIkHaMUnxX3m2v
 hodSeLhadYuHzbp23yELabj6LnzScvMgqLU9iy2mrRcl85VdRFeZo1P5n4b6aPnZIYmH
 xn604EHzMj6UJwieJxk4wLHrDqoPciQYdJYDLnctoRILe5yNEeFY6RrI/rXTevKPUxiD
 2SdXHfcLw6Hxs+gN9dtCHZDbNBhzQ700ooZBO6RUKWYrKsRFvC7byijRSdjxruGXoses
 RJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DEhHTsEmiiqH++K1yF6RsVx2oxwAvUspDpHpkLQdk/E=;
 b=LmUmuhZpmrYFmvoW8VkxtftOxYZ3be/dRXKtAkj0+fpkrDtS5H62JjCqvu+/EBN3gO
 yCN8/vijv/rbd0GKb67osTqYRgAAkLcCyhRayMdFViOlXNngSBYhi/xiThX1q9Ebt8yB
 +yxz9UitNOLCqKI0/QcmqAB6dAZ6QE78jvKpIGm8zzZhT2xVjnRHTZhjwWYVQt8RQN9+
 RNKmriDoV5ly4Ph/i5+ACT+M2iB+I2Uk6UcWkj4KEeQPcG+kkwZEjVt2UKG0/Wi8az9I
 c37w25FGjf0jlQciGm6mhnaxDnJpfngL7qrrh9fK6cb0GxTPe54uPGOIkp/W2DwxLnTN
 Y8zQ==
X-Gm-Message-State: ANoB5pnXKqK4veZf3iH2xznJQOZo/6P/eLPiFy7wXf+DEEC/+6TEK5W+
 fn9IaIgzrIX9UqbgzZRh/hg=
X-Google-Smtp-Source: AA0mqf7Ld59n3I6bPuGzL9LDoaavH1H0LuVD0ph9BMvCZW5xJKfVwIG5wdY1q77k8htGHLTI6z102g==
X-Received: by 2002:a05:6830:355:b0:670:6326:7422 with SMTP id
 h21-20020a056830035500b0067063267422mr2277961ote.5.1670450780653; 
 Wed, 07 Dec 2022 14:06:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 o6-20020acad706000000b003549db40f38sm9873469oig.46.2022.12.07.14.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 14:06:20 -0800 (PST)
Date: Wed, 7 Dec 2022 14:06:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, John Millikin <john@john-millikin.com>
Subject: Re: [PULL 02/39] scsi: Add buf_len parameter to scsi_req_new()
Message-ID: <20221207220618.GA1414810@roeck-us.net>
References: <20220901182429.93533-1-pbonzini@redhat.com>
 <20220901182429.93533-3-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901182429.93533-3-pbonzini@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.21, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Sep 01, 2022 at 08:23:52PM +0200, Paolo Bonzini wrote:
> From: John Millikin <john@john-millikin.com>
> 
> When a SCSI command is received from the guest, the CDB length implied
> by the first byte might exceed the number of bytes the guest sent. In
> this case scsi_req_new() will read uninitialized data, causing
> unpredictable behavior.
> 
> Adds the buf_len parameter to scsi_req_new() and plumbs it through the
> call stack.
> 
> Signed-off-by: John Millikin <john@john-millikin.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1127
> Message-Id: <20220817053458.698416-1-john@john-millikin.com>
> [Fill in correct length for adapters other than ESP. - Paolo]
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/scsi/esp.c          |  2 +-
>  hw/scsi/lsi53c895a.c   |  2 +-
>  hw/scsi/megasas.c      | 10 +++++-----

...

> @@ -1823,7 +1823,7 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
>  
>      megasas_encode_lba(cdb, lba_start, lba_count, is_write);
>      cmd->req = scsi_req_new(sdev, cmd->index,
> -                            lun_id, cdb, cmd);
> +                            lun_id, cdb, cdb_len, cmd);

This doesn't work for me. cdb is a local array in this function,
its contents are filled in the function, and Linux doesn't set the
cdb_len field for io requests (or, rather, treats it as reserved
field and sets it to 0). This results in Linux boot failures when
trying to boot from the affected controllers.

The patch below fixes the problem for me, though I have no idea if
it is correct.

Guenter

---
From 687093dc7e48ce42de22c5675a1005890f014f22 Mon Sep 17 00:00:00 2001
From: Guenter Roeck <linux@roeck-us.net>
Date: Wed, 7 Dec 2022 13:45:07 -0800
Subject: [PATCH] scsi: megasas: Internal cdbs have 16-byte length

Linux does not set cdb_len in megasas io commands. With commits d1511cea0
("scsi: Reject commands if the CDB length exceeds buf_len") and fe9d8927e2
("scsi: Add buf_len parameter to scsi_req_new()"), this results in
failures to boot from affected SCSI drives because cdb_len is 0.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/scsi/megasas.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 9cbbb16121..d624866bb6 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1780,7 +1780,7 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
     uint8_t cdb[16];
     int len;
     struct SCSIDevice *sdev = NULL;
-    int target_id, lun_id, cdb_len;
+    int target_id, lun_id;
 
     lba_count = le32_to_cpu(cmd->frame->io.header.data_len);
     lba_start_lo = le32_to_cpu(cmd->frame->io.lba_lo);
@@ -1789,7 +1789,6 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
 
     target_id = cmd->frame->header.target_id;
     lun_id = cmd->frame->header.lun_id;
-    cdb_len = cmd->frame->header.cdb_len;
 
     if (target_id < MFI_MAX_LD && lun_id == 0) {
         sdev = scsi_device_find(&s->bus, 0, target_id, lun_id);
@@ -1804,15 +1803,6 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
         return MFI_STAT_DEVICE_NOT_FOUND;
     }
 
-    if (cdb_len > 16) {
-        trace_megasas_scsi_invalid_cdb_len(
-            mfi_frame_desc(frame_cmd), 1, target_id, lun_id, cdb_len);
-        megasas_write_sense(cmd, SENSE_CODE(INVALID_OPCODE));
-        cmd->frame->header.scsi_status = CHECK_CONDITION;
-        s->event_count++;
-        return MFI_STAT_SCSI_DONE_WITH_ERROR;
-    }
-
     cmd->iov_size = lba_count * sdev->blocksize;
     if (megasas_map_sgl(s, cmd, &cmd->frame->io.sgl)) {
         megasas_write_sense(cmd, SENSE_CODE(TARGET_FAILURE));
@@ -1823,7 +1813,7 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
 
     megasas_encode_lba(cdb, lba_start, lba_count, is_write);
     cmd->req = scsi_req_new(sdev, cmd->index,
-                            lun_id, cdb, cdb_len, cmd);
+                            lun_id, cdb, sizeof(cdb), cmd);
     if (!cmd->req) {
         trace_megasas_scsi_req_alloc_failed(
             mfi_frame_desc(frame_cmd), target_id, lun_id);
-- 
2.36.2


