Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 895DB3C1935
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:31:42 +0200 (CEST)
Received: from localhost ([::1]:35910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YoF-00010Q-9F
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m1Xue-0005rT-6Y
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:34:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m1Xuc-00087v-0g
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625765649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7nxGrkHCbVsDgAjVEk+XApAnpg6nLIcfFWjq6WaOCg=;
 b=f8+ezHW33D567sFaaqKAj53MWpqqDrnR/zqP22LOoURl8ir2n04rmAJtMIeuo95shwTfbz
 z2wN6FDVsg7RC9M3uHQ6dtt51bOQ+Eq3IKUC/wP2Dhs6559E2AVwnPDsRgqsXIQURGSRN9
 hCleOiiv5/IvVHkQBfnJTpiS8KXk29M=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-5NDQCTFCOt2sKcyjAiZLPg-1; Thu, 08 Jul 2021 13:34:08 -0400
X-MC-Unique: 5NDQCTFCOt2sKcyjAiZLPg-1
Received: by mail-qv1-f69.google.com with SMTP id
 p12-20020a0cfacc0000b02902a1b4396bc4so4536199qvo.22
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=S7nxGrkHCbVsDgAjVEk+XApAnpg6nLIcfFWjq6WaOCg=;
 b=j9DwkfCgZL6wXjKhxm+/pm5IqfR01H6PHeozsWGhakjkYRbFX2YdFGuL6QdIirdcr8
 CIy/wWKIX75tPpYqevW2dnCIAPw1T2IjAl4v+/VKeaMRp0X43VXHmRHyO8NpjP4vbblu
 zIk4sZuG3iN+r55vxMj6dGbZdul2f6kEHe5LcypfrAMkJjkHwoeknRmgJz2fE4wqqJ/O
 DwetsF1TrjWAWNwS6NLiwbhQbIMzrLH5wgjYpFJpocDBhnbriIhMgNcPjX3Fqx7aUbLw
 zwbg4JUdlI05fN7FnGyrnyGlkm6IdcCR3pN7RmEIMyRCTZ0KwpbaMOocPi4ZyxSZotqp
 Ud6Q==
X-Gm-Message-State: AOAM531vOcyZRgUTZmTQToNkhzzUpaVl2n2l9b35nXlK7VPTa8p2Rdv6
 3kIkZPCNhXmMdtIGynb2RJROR68p7haLFRbVpJavmkEMTMv+La4g4aojXICk5bOl5ehgkBamNu0
 mgj8zgLddHSxKxd0=
X-Received: by 2002:a37:7ac7:: with SMTP id v190mr31151584qkc.35.1625765647010; 
 Thu, 08 Jul 2021 10:34:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykguyNXtPBpdfZKVvQ9RiyCMh918cpxW81/IUcc0rVYGSBqSyg3ksvGw1tvAdoWCpqsJNipw==
X-Received: by 2002:a37:7ac7:: with SMTP id v190mr31151567qkc.35.1625765646808; 
 Thu, 08 Jul 2021 10:34:06 -0700 (PDT)
Received: from p50.localhost.localdomain
 ([2601:18d:8a00:ab70:b677:d979:630:695c])
 by smtp.gmail.com with ESMTPSA id k66sm1347103qke.84.2021.07.08.10.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 10:34:06 -0700 (PDT)
Subject: Re: [PATCH v5 1/4] avocado_qemu: Fix KNOWN_DISTROS map into the
 LinuxDistro class
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 philmd@redhat.com, wainersm@redhat.com
References: <20210706131729.30749-1-eric.auger@redhat.com>
 <20210706131729.30749-2-eric.auger@redhat.com>
 <df9835de-fe4a-2233-a625-3b04b7b0d514@redhat.com>
 <917bb587-ccd1-cac7-1e82-d2f869feaf02@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Message-ID: <7e1cf0c6-97b4-ebfe-f046-c2fe06e5e6e3@redhat.com>
Date: Thu, 8 Jul 2021 13:34:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <917bb587-ccd1-cac7-1e82-d2f869feaf02@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: wrampazz@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 7/8/21 4:56 AM, Eric Auger wrote:
>
> I am not sufficiently expert on the test infra and python to be really
> efficient fixing that. Can anyone help quickly to target the soft
> freeze? Otherwise, today I will drop that patch and restore the code I
> had in v4, just based on Cleber series. I think the refactoring can
> happen later...


Hi Eric,


The following diff works for me:


diff --git a/tests/acceptance/avocado_qemu/__init__.py 
b/tests/acceptance/avocado_qemu/__init__.py
index af93cd63ea..b3bed00062 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -310,6 +310,8 @@ class LinuxDistro:
              '31': {
                  'x86_64':
                  {'checksum': 
'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'},
+                'aarch64':
+                {'checksum': 
'1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'},
                  'ppc64':
                  {'checksum': 
'7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
                  's390x':
@@ -323,10 +325,11 @@ def __init__(self, name, version, arch):
          self.version = version
          self.arch = arch
          try:
-            self._info = 
self.KNOWN_DISTROS.get(name).get(version).get(arch)
+            info = self.KNOWN_DISTROS.get(name).get(version).get(arch)
          except AttributeError:
              # Unknown distro
-            self._info = {}
+            info = None
+        self._info = info or {}

      @property
      def checksum(self):


I've tested it with both existing and the newly introduced tests.


Cheers,

- Cleber.


