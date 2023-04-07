Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC956DB7E3
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 02:53:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkwop-0003oD-OT; Fri, 07 Apr 2023 20:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukts330@gmail.com>)
 id 1pkuJ7-0005gK-2w; Fri, 07 Apr 2023 18:11:45 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lukts330@gmail.com>)
 id 1pkuJ5-0006K0-90; Fri, 07 Apr 2023 18:11:44 -0400
Received: by mail-wr1-x442.google.com with SMTP id h17so43246437wrt.8;
 Fri, 07 Apr 2023 15:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680905500; x=1683497500;
 h=content-transfer-encoding:cc:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y/8EIferPDosy0OJzf3MZ/j4h9qECl+ovy1rLZhgpiE=;
 b=Ptm2BbDC7RYa2fWP2qVCnHM33Vuq6Nva/z0t/3L5gLED55Y+7rZgboAhGSV/PkRck3
 UeN2Q/vsjVlgMXBkrfsKhdKE/1eeogd2EaOYjMeq7kCXt6h1GiXQjbEuCP1Ea9TIPj9E
 oeI81hvGcPS5WG998XTXNxLRENf2HPPDEPX9WkSwoNymz5ivKPfoR5YBtNN8XLxqe3dm
 T1PtSIuu8Gun89C/rUii8jlnuWN4e1/ZZ3IyFG44t4Wuyp9jNXRVYH9ElFAAuqiJUBAd
 2BFW2CgPoZwW1scUdzbjs2iU0Q7dLVQtAQowOd5pYrGGl523FXPF4wxz00lh813slRGD
 b9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680905500; x=1683497500;
 h=content-transfer-encoding:cc:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=y/8EIferPDosy0OJzf3MZ/j4h9qECl+ovy1rLZhgpiE=;
 b=T6NiNgPGaQG/w/p5Jkxd3Y4fs0UGzAP3OVCQl073tsMZwp+t0lMK7YRkPY0Ve2Rstb
 CGrQLW/MdwKj0vSZ4nN/RoflmWMhxXy+EEovNcdLh0P+h6Aze63Oei8AihFtjA8NmGp9
 n++fDSRFkgluvNmA2HPZ7AELUFYyIb2luI3Dh0vAOT80tznFir4gxnLcPZonogD8LjB1
 qEFm54Fxc0VyfFNoUDtK6xY8xmzb8FpSAdwU3jmS22UMPXbQPYzDI+Pv9hjBZkFuPu9v
 o2VVVdjB2EzNufYHgh52Qn66EiQ8wVbpAd0MwrN+iqKjL3014V/m77H84bcot83rK5K4
 90Lg==
X-Gm-Message-State: AAQBX9fGAYw+oPkDpbdQ6MLXAzt8EmfYqFIDAloEn17j833DS1bMMt34
 V4zHJD4B7xJQv2rzAFZyAqEng2tPTxnOfAJWsjY=
X-Google-Smtp-Source: AKy350bOLN/epeSAoXRjSErqsGYSTVkDBWZdG13wT6HbzawV4IOba8Pipj06wuAS0w7Uee76gX2VUg==
X-Received: by 2002:a5d:5451:0:b0:2ef:b433:2942 with SMTP id
 w17-20020a5d5451000000b002efb4332942mr1483177wrv.21.1680905500418; 
 Fri, 07 Apr 2023 15:11:40 -0700 (PDT)
Received: from ?IPV6:2003:f8:5704:ee00:e891:d419:e775:59fe?
 (p200300f85704ee00e891d419e77559fe.dip0.t-ipconnect.de.
 [2003:f8:5704:ee00:e891:d419:e775:59fe])
 by smtp.gmail.com with ESMTPSA id
 w9-20020adfec49000000b002cde25fba30sm5511335wrn.1.2023.04.07.15.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 15:11:39 -0700 (PDT)
Message-ID: <6cfb6d6b-adc5-7772-c8a5-6bae9a0ad668@gmail.com>
Date: Sat, 8 Apr 2023 00:11:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: qemu-devel@nongnu.org
From: Lukas Tschoke <lukts330@gmail.com>
Subject: [PATCH] block/vhdx: fix dynamic VHDX BAT corruption
Cc: qemu-block@nongnu.org, kwolf@redhat.com, lukts330@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=lukts330@gmail.com; helo=mail-wr1-x442.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 07 Apr 2023 20:52:38 -0400
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

The corruption occurs when a BAT entry aligned to 4096 bytes is changed.

Specifically, the corruption occurs during the creation of the LOG Data
Descriptor. The incorrect behavior involves copying 4088 bytes from the
original 4096 bytes aligned offset to `tmp[8..4096]` and then copying
the new value for the first BAT entry to the beginning `tmp[0..8]`.
This results in all existing BAT entries inside the 4K region being
incorrectly moved by 8 bytes and the last entry being lost.

This bug did not cause noticeable corruption when only sequentially
writing once to an empty dynamic VHDX (e.g.
using `qemu-img convert -O vhdx -o subformat=dynamic ...`), but it
still resulted in invalid values for the (unused) Sector Bitmap BAT
entries.

Importantly, this corruption would only become noticeable after the
corrupted BAT is re-read from the file.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/727
Signed-off-by: Lukas Tschoke <lukts330@gmail.com>
---
 block/vhdx-log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/vhdx-log.c b/block/vhdx-log.c
index c48cf65d62..38148f107a 100644
--- a/block/vhdx-log.c
+++ b/block/vhdx-log.c
@@ -981,7 +981,7 @@ static int vhdx_log_write(BlockDriverState *bs, BDRVVHDXState *s,
             sector_write = merged_sector;
         } else if (i == sectors - 1 && trailing_length) {
             /* partial sector at the end of the buffer */
-            ret = bdrv_pread(bs->file, file_offset,
+            ret = bdrv_pread(bs->file, file_offset + trailing_length,
                              VHDX_LOG_SECTOR_SIZE - trailing_length,
                              merged_sector + trailing_length, 0);
             if (ret < 0) {
-- 
2.40.0



