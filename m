Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5D2489BAF
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:59:18 +0100 (CET)
Received: from localhost ([::1]:38846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6w8j-0003OR-68
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:59:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqm-0001pr-QS
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:44 -0500
Received: from [2a00:1450:4864:20::530] (port=38630
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vql-0000SC-5s
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:44 -0500
Received: by mail-ed1-x530.google.com with SMTP id u21so31868538edd.5
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W1sRcArNgPLfMk3/muBjnzR5DIWfkwyjUMPup557DbA=;
 b=oyRj5qf/dNS07mETBS8ZTpGU83fTTsCFZXuEkM8qlv8Z9oi5UiyhGKrIg/UZxJZlDo
 n/gweIL7os5KrsYc1cWhoutFmcDVQ++YdFBEuBf95ttaPp0TvQ4A1l5OGocRc0F7auar
 gUmApoi+coeQNP+8D4dFcAMyVDsnr3V67pXRgBX8pVVObvko39xnzhOI5iTTLp+3Vsnu
 VC2H0jaQ8REuA9Q8Y/kWESojSKpwAQ59gz63zc2d4VWC+U21SFGUgL9oV2MsIcwZ71L7
 VQGjrWDcjq2GY1vsbAa9iQXyC81CDTZdDYhfoBZrhSTFPDc1uzX1b3xv74fiGgQHH96o
 /jUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=W1sRcArNgPLfMk3/muBjnzR5DIWfkwyjUMPup557DbA=;
 b=cM5x7IypO8uhgCWbrHgn0gx8du2YHqwmeP0tXZkpU2cyyUMEpTcmZ5jL7y/Qqt9bDW
 AeMIkUtBsTdf5Xd/RJ+DwD3EnGRlJcMtyGPZGdmXEJt5faV3nJj/AmwDe0VMwvJcRsdq
 yeHtvBfwdZjV93kOfpqOlqL+LjpTxHU2tKpYzJOZqqoiZkb8GjJkmhc2gKBMAX4Kq21W
 na15GhS6mwEJUOCgX448is5lYGqxAdntAZ2c8bBjX4bTMIe8FZGtpnvzCqEMPMqV1PCJ
 LHmGiZHKEdiFczHT3S3qs5WWnHhKxqHp3hvXcFDDlckonpPAIfvqByLw8FtL0GGQryAn
 efzw==
X-Gm-Message-State: AOAM531gaT0Nmbm9HOFPYQTpuqXjFfCaxJpCjni/OikkTBorxrSHMJMD
 RtHWXW5uYBhgHY6rsgzdUD704C8Ps9Y=
X-Google-Smtp-Source: ABdhPJwwYxu0sqU/3yH83hnM9dmGrZVf0zyqUcY4w748p6YS3uffF7/bk5YVpzJ2ZEthSIgvc6sxUQ==
X-Received: by 2002:a17:907:7d8f:: with SMTP id
 oz15mr38387ejc.245.1641825641632; 
 Mon, 10 Jan 2022 06:40:41 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:40:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/18] meson: reuse common_user_inc when building files
 specific to user-mode emulators
Date: Mon, 10 Jan 2022 15:40:17 +0100
Message-Id: <20220110144034.67410-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
References: <20220110144034.67410-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 53065e96ec..de111d6fa1 100644
--- a/meson.build
+++ b/meson.build
@@ -2919,6 +2919,7 @@ foreach target : target_dirs
   else
     abi = config_target['TARGET_ABI_DIR']
     target_type='user'
+    target_inc += common_user_inc
     qemu_target_name = 'qemu-' + target_name
     if target_base_arch in target_user_arch
       t = target_user_arch[target_base_arch].apply(config_target, strict: false)
@@ -2927,7 +2928,6 @@ foreach target : target_dirs
     endif
     if 'CONFIG_LINUX_USER' in config_target
       base_dir = 'linux-user'
-      target_inc += include_directories('linux-user/host/' / host_arch)
     endif
     if 'CONFIG_BSD_USER' in config_target
       base_dir = 'bsd-user'
-- 
2.33.1



