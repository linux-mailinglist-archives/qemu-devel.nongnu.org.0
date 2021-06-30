Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCD63B8AF0
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 01:24:30 +0200 (CEST)
Received: from localhost ([::1]:45044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyjZF-0001um-7l
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 19:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyjXt-0001Ek-E3
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 19:23:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyjXp-0006ZA-I8
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 19:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625095379;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O29xEkTcELnTctVoZHcbOFLg0qLZHwW7XHebZBPVOjc=;
 b=LEfgf3Hp1FQyscTfclx2OIsS2x6eQDWymHsEiqDvRmopb1cKkrWt1b22BMbg8mbVtxGJU6
 N8MQxTcFsAFvMjwt0RCjzBKtQjXo4Kx1tQMMLf/M+2sBdjBPLrhonDCC/UZt6tO3hwQzoL
 Q3XCC+ms6+LT5GGm9eRVRe7WrpKKkqQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-uTEs7vhhP7WHbsf9d7HkXQ-1; Wed, 30 Jun 2021 19:22:55 -0400
X-MC-Unique: uTEs7vhhP7WHbsf9d7HkXQ-1
Received: by mail-pl1-f197.google.com with SMTP id
 x17-20020a1709027c11b0290122d280f05bso1675572pll.8
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 16:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=O29xEkTcELnTctVoZHcbOFLg0qLZHwW7XHebZBPVOjc=;
 b=mMH5SM3FJ9keaJabU/Z/LI1L3OR6kgOgbcgHKImB8C+bxmjNvboGvXMja8GiOFlFGP
 2FsdYbRodk2N7nNs9NoEapHttCnVV6dhBtRPpwZH9aovzl7I/xzvcEuxKzydJah3nru0
 bCHmb5J1Lad3V74MWh9duaW3SjFqfoCpLBq/MoBEaU/WEtHWiZ1PxkqyeE1m/hTt+d5w
 hlOjPzyh4jHMxZC8rfgRpOQVDfhMlwHliQmswFNB1hx2xvaCVayRfzGEBsf/t1+s1q+z
 L7rlXEFIHZhnK3iQ6EdYjt/cP6lTQzdSEh3tF3Vwsk3zOm3aWLhY45hokluPa9iF5//Y
 ZatQ==
X-Gm-Message-State: AOAM532wIZORG/aFgbL4axESALtRE2MEuOqOsS2FA3uD3d9BpE/h2T7X
 sku148qDt7XvTUHbEiGizoY5mvPfO2k0IKl62s/LKnxXdnpqI+x6Ig+4+lP0jrFENj4LIu+9ntn
 zyiIQlpQg68wdoUI=
X-Received: by 2002:a63:5511:: with SMTP id j17mr37188245pgb.191.1625095374148; 
 Wed, 30 Jun 2021 16:22:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAVF66MxlfrknUJUHjZjRH4hQWxK1ZoTkzVZF95qwo9Isw9HWoK1/AAkJhjRUI1gI5SiwNwA==
X-Received: by 2002:a63:5511:: with SMTP id j17mr37188224pgb.191.1625095373919; 
 Wed, 30 Jun 2021 16:22:53 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id b6sm23032928pgw.67.2021.06.30.16.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 16:22:53 -0700 (PDT)
Subject: Re: [PATCH v4 0/4] avocado-qemu: New SMMUv3 and intel IOMMU tests
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 philmd@redhat.com, crosa@redhat.com
References: <20210629143621.907831-1-eric.auger@redhat.com>
 <e59e1cf9-d22e-e5f2-dfce-9997d2f61e03@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <a63cae4d-365f-2f48-2de1-be50197f6f4d@redhat.com>
Date: Wed, 30 Jun 2021 20:22:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e59e1cf9-d22e-e5f2-dfce-9997d2f61e03@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: wainersm@redhat.com
Cc: wrampazz@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 6/29/21 5:17 PM, Eric Auger wrote:
> Hi Cleber, all,
>
> On 6/29/21 4:36 PM, Eric Auger wrote:
>> This series adds ARM SMMU and Intel IOMMU functional
>> tests using Fedora cloud-init images.
>>
>> ARM SMMU tests feature guests with and without RIL
>> (range invalidation support) using respectively fedora 33
>> and 31.  For each, we test the protection of virtio-net-pci
>> and virtio-block-pci devices. Also strict=no and passthrough
>> modes are tested. So there is a total of 6 tests.
>>
>> The series applies on top of Cleber's series:
>> - [PATCH 0/3] Acceptance Tests: support choosing specific
>>
>> Note:
>> - SMMU tests 2, 3, 5, 6 (resp. test_smmu_noril_passthrough and
>> test_smmu_noril_nostrict) pass but the log reports:
>> "WARN: Test passed but there were warnings during execution."
>> This seems due to the lack of hash when fetching the kernel and
>> initrd through fetch_asset():
>> WARNI| No hash provided. Cannot check the asset file integrity.
> I wanted to emphasize that point and wondered how we could fix that
> issue. Looks a pity the tests get tagged as WARN due to a lack of sha1.
> Any advice?

As Willian mentioned somewhere, to supress the WARN you can pass the 
kernel and initrd checksums (sha1) to the fetch_asset() method.

Below is an draft implementation. It would need to fill out the 
remaining checksums and adjust the `smmu.py` tests.

- Wainer

----

diff --git a/tests/acceptance/avocado_qemu/__init__.py 
b/tests/acceptance/avocado_qemu/__init__.py
index 00eb0bfcc8..83637e2654 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -312,6 +312,8 @@ class LinuxDistro:
                  {'checksum': 
'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0',
                  'pxeboot_url': 
"https://archives.fedoraproject.org/pub/archive/fedora/"
"linux/releases/31/Everything/x86_64/os/images/pxeboot/",
+                'pxeboot_initrd_chksum': 
'dd0340a1b39bd28f88532babd4581c67649ec5b1',
+                'pxeboot_vmlinuz_chksum': 
'5b6f6876e1b5bda314f93893271da0d5777b1f3c',
                  'kernel_params': 
"root=UUID=b1438b9b-2cab-4065-a99a-08a96687f73c ro "
                                "no_timer_check net.ifnames=0 "
                                "console=tty1 console=ttyS0,115200n8"},
@@ -371,6 +373,16 @@ def pxeboot_url(self):
          """Gets the repository url where pxeboot files can be found"""
          return self._info.get('pxeboot_url', None)

+    @property
+    def pxeboot_initrd_chksum(self):
+        """Gets the pxeboot initrd file checksum"""
+        return self._info.get('pxeboot_initrd_chksum', None)
+
+    @property
+    def pxeboot_vmlinuz_chksum(self):
+        """Gets the pxeboot vmlinuz file checksum"""
+        return self._info.get('pxeboot_vmlinuz_chksum', None)
+
      @property
      def checksum(self):
          """Gets the cloud-image file checksum"""
diff --git a/tests/acceptance/intel_iommu.py 
b/tests/acceptance/intel_iommu.py
index bf8dea6e4f..a2f38ee2e9 100644
--- a/tests/acceptance/intel_iommu.py
+++ b/tests/acceptance/intel_iommu.py
@@ -55,8 +55,10 @@ def common_vm_setup(self, custom_kernel=None):

          kernel_url = self.distro.pxeboot_url + 'vmlinuz'
          initrd_url = self.distro.pxeboot_url + 'initrd.img'
-        self.kernel_path = self.fetch_asset(kernel_url)
-        self.initrd_path = self.fetch_asset(initrd_url)
+        self.kernel_path = self.fetch_asset(kernel_url,
+ asset_hash=self.distro.pxeboot_vmlinuz_chksum)
+        self.initrd_path = self.fetch_asset(initrd_url,
+ asset_hash=self.distro.pxeboot_initrd_chksum)

      def run_and_check(self):
          if self.kernel_path:

>
> Best Regards
>
> Eric
>> History:
>> v3 -> v4:
>> - I added Wainer's refactoring of KNOWN_DISTROS
>> into a class (last patch) and took into account his comments.
>>
>> v2 -> v3:
>> - Added Intel IOMMU tests were added. Different
>> operating modes are tested such as strict, caching mode, pt.
>>
>> Best Regards
>>
>> Eric
>>
>> The series and its dependencies can be found at:
>> https://github.com/eauger/qemu/tree/avocado-qemu-v4
>>
>> Eric Auger (3):
>>    Acceptance Tests: Add default kernel params and pxeboot url to the
>>      KNOWN_DISTROS collection
>>    avocado_qemu: Add SMMUv3 tests
>>    avocado_qemu: Add Intel iommu tests
>>
>> Wainer dos Santos Moschetta (1):
>>    avocado_qemu: Fix KNOWN_DISTROS map into the LinuxDistro class
>>
>>   tests/acceptance/avocado_qemu/__init__.py | 118 +++++++++++++------
>>   tests/acceptance/intel_iommu.py           | 115 +++++++++++++++++++
>>   tests/acceptance/smmu.py                  | 132 ++++++++++++++++++++++
>>   3 files changed, 332 insertions(+), 33 deletions(-)
>>   create mode 100644 tests/acceptance/intel_iommu.py
>>   create mode 100644 tests/acceptance/smmu.py
>>


