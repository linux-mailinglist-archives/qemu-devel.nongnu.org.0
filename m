Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121DA661EA8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 07:24:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pElYw-0004iw-Ju; Mon, 09 Jan 2023 01:23:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pElYu-0004ig-Kl
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 01:23:12 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pElYs-00054q-QE
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 01:23:12 -0500
Received: by mail-pf1-x430.google.com with SMTP id a184so5359391pfa.9
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 22:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YqeIKu6Sd+sjJ+iNsDcqylD6czn18ZYvBY28zrMySdM=;
 b=PljgJ03R53eDyuflbIGh3pRorQ3zHGvbx3FJ0RKimzGy0Tq5xOMiCjV1ePvZ35lHYe
 HlOS6VddEoMv04bG001SRjp0H8SRq3QVfVJ+xW+sU66y5bSN0/SgKhW/fU7AEzFWQBkG
 DZMfO7fqYB2L7AOCBglk2Z1D/UzyjZnv4hNhtWMLU9PEeBKA2DBLYnGAGHGCHPz24Qqe
 y7frve90kZB4peO6Y0ICmuF+r1Yi6gOdGT0zfwKw3Dw+GevAHRKc81xQluypoGzF3V3Y
 jR+Fqh8UMTPxeV0hl3POTVr+ckKwViJoZp/hSmv599Y8euWbOIO8zFPdZ/AUsAM71wpQ
 Gw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YqeIKu6Sd+sjJ+iNsDcqylD6czn18ZYvBY28zrMySdM=;
 b=BoMI0RhGTDVPa721YW69TXjK/YceH480TCEumup8fFu34xmA9c+Mkr2WuH/M+TWnXz
 pEG0WrJpsjl+I4Wcd+dpeMA0BVtdmOBy8C01Ncbn1H6yDarNcAKBPb0VU+Ex+D6XleQx
 pp3M4dArl6hPRBG4klYD2zfb84NNEwNwLasGxmybwmsNfuVfQWaD2hisOyjYw3/G0iMX
 mFqRZ8+YJ1eoZGgHETOM910L80hw5ztRDdv+sKOttZwNhf+EDnW8BS4zrp/YWLnHWN1R
 mMI5eAbCzV76H0T4jfn/ki/SR/UsZcDrR50GENY8TLX+rFl0KErQy4VuqIcVnJNU35Gt
 UAcA==
X-Gm-Message-State: AFqh2kqCL7Tjz+RqTYVyn739Fc3merRIaAqNWxggApt7Wg2EW3drpZzJ
 I3QOx1wOSjwESjQiUZwXm4QltGaNke3hD95J
X-Google-Smtp-Source: AMrXdXv8ulwn5R5diE+Dj2M0IlSjayGIMXCpZLIOmuIYaXDKeZUY3ukTbynE8lQ/G6adLQkzcDP1OQ==
X-Received: by 2002:a05:6a00:21d1:b0:588:cb81:9276 with SMTP id
 t17-20020a056a0021d100b00588cb819276mr2016802pfj.25.1673245388547; 
 Sun, 08 Jan 2023 22:23:08 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 i11-20020aa796eb000000b0056d7cc80ea4sm5207492pfq.110.2023.01.08.22.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 22:23:08 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] accel/kvm: Specify default IPA size for arm64
Date: Mon,  9 Jan 2023 15:22:59 +0900
Message-Id: <20230109062259.79074-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::430;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

libvirt uses "none" machine type to test KVM availability. Before this
change, QEMU used to pass 0 as machine type when calling KVM_CREATE_VM.

The kernel documentation says:
> On arm64, the physical address size for a VM (IPA Size limit) is
> limited to 40bits by default. The limit can be configured if the host
> supports the extension KVM_CAP_ARM_VM_IPA_SIZE. When supported, use
> KVM_VM_TYPE_ARM_IPA_SIZE(IPA_Bits) to set the size in the machine type
> identifier, where IPA_Bits is the maximum width of any physical
> address used by the VM. The IPA_Bits is encoded in bits[7-0] of the
> machine type identifier.
>
> e.g, to configure a guest to use 48bit physical address size::
>
>     vm_fd = ioctl(dev_fd, KVM_CREATE_VM, KVM_VM_TYPE_ARM_IPA_SIZE(48));
>
> The requested size (IPA_Bits) must be:
>
>  ==   =========================================================
>   0   Implies default size, 40bits (for backward compatibility)
>   N   Implies N bits, where N is a positive integer such that,
>       32 <= N <= Host_IPA_Limit
>  ==   =========================================================

> Host_IPA_Limit is the maximum possible value for IPA_Bits on the host
> and is dependent on the CPU capability and the kernel configuration.
> The limit can be retrieved using KVM_CAP_ARM_VM_IPA_SIZE of the
> KVM_CHECK_EXTENSION ioctl() at run-time.
>
> Creation of the VM will fail if the requested IPA size (whether it is
> implicit or explicit) is unsupported on the host.
https://docs.kernel.org/virt/kvm/api.html#kvm-create-vm

So if Host_IPA_Limit < 40, such KVM_CREATE_VM will fail, and libvirt
incorrectly thinks KVM is not available. This actually happened on M2
MacBook Air.

Fix this by specifying 32 for IPA_Bits as any arm64 system should
support the value according to the documentation.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 accel/kvm/kvm-all.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e86c33e0e6..776ac7efcc 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2294,7 +2294,11 @@ static int kvm_init(MachineState *ms)
     KVMState *s;
     const KVMCapabilityInfo *missing_cap;
     int ret;
+#ifdef TARGET_AARCH64
+    int type = 32;
+#else
     int type = 0;
+#endif
     uint64_t dirty_log_manual_caps;
 
     qemu_mutex_init(&kml_slots_lock);
-- 
2.39.0


