Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254553BD811
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 15:59:06 +0200 (CEST)
Received: from localhost ([::1]:43228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0lbL-00026t-TL
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 09:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1m0lZp-0000Fv-PW
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:57:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1m0lZn-0001pc-Vu
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625579847;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zf73c2qEnhewkd7KXlkdMtw71o8gG4q2X37har4kq5I=;
 b=dumGXpoTO4GZn+lIhVll1U0K4y9q1gL3yCas1hysZv1PQ2IuCcSbbAQr8nil+q44li+8r2
 bZDmCIB5ZzrjwFqYjh9xlrzM5IiVNSYEPghDsJ+TF/3hd/DPVFTCfi/IX8A8C4nxqty+73
 IrzR1UBh+WtNwfX77L5OrJM0rzxSy6s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-kiuPybbwMu6rFwMSEmOh_w-1; Tue, 06 Jul 2021 09:57:25 -0400
X-MC-Unique: kiuPybbwMu6rFwMSEmOh_w-1
Received: by mail-wr1-f69.google.com with SMTP id
 u13-20020a5d6dad0000b029012e76845945so5113389wrs.11
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 06:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=zf73c2qEnhewkd7KXlkdMtw71o8gG4q2X37har4kq5I=;
 b=suj5f8cPygqf6DAZaT1DwNdLsV0hzZrqr9ovu1AyCZIZRfLm5q9acPNnDBCXNqrPo0
 EJAtkiLCoYPGGPHMkxrVmXcipCrzbA40fKVBTgUQkEckIU+07yELN0VgcSW2owqy8xkf
 Q71oF45LAiDt3l9j0jVJ2nsYcf3JZRuV9CbEN91OCT+bR5tUsiqCVRzYjsgwopZ/7qQw
 Oa3vxBwuBFBiUpu9aatX9reK8K+5joPO7lGnIs467c7FfldBVR6URMjAMIweQadrUcNv
 drQ5iYbC6q3K8EekG7eTPGvEWtO2MyLW6duMHmWXE90CgHS/0QJwrfwhweVFGMeHcxxs
 6cVA==
X-Gm-Message-State: AOAM531AZJw+tpbkwNKu4JPT1RRcB+KSgH5aUH9E1BBpjHxy+NMEPo0s
 QLc0ZYBxbfdOv0fCIrpMRzL3FltysqqwmgPotktZw7ZYg8wms/UloIqEg6QyAEUMJvt2mnQawBS
 fPTgHzKK6bSW4caI=
X-Received: by 2002:adf:f606:: with SMTP id t6mr21931600wrp.52.1625579844703; 
 Tue, 06 Jul 2021 06:57:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2/ldj8mtYE9N0FmrUgL6u270hWBc8wXKBC9spzAVW0Dq1VdgrvT98axjBkghcG8j3uO8LJg==
X-Received: by 2002:adf:f606:: with SMTP id t6mr21931575wrp.52.1625579844509; 
 Tue, 06 Jul 2021 06:57:24 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id i12sm2078383wrp.57.2021.07.06.06.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 06:57:23 -0700 (PDT)
Subject: Re: [PATCH v5 3/4] avocado_qemu: Add SMMUv3 tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, crosa@redhat.com,
 wainersm@redhat.com
References: <20210706131729.30749-1-eric.auger@redhat.com>
 <20210706131729.30749-4-eric.auger@redhat.com>
 <cc5d8c32-4014-96aa-73cd-da0c4d41a59a@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <43273a56-8deb-3db5-2a90-96f508b3a2d4@redhat.com>
Date: Tue, 6 Jul 2021 15:57:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <cc5d8c32-4014-96aa-73cd-da0c4d41a59a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Reply-To: eric.auger@redhat.com
Cc: wrampazz@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 7/6/21 3:34 PM, Philippe Mathieu-Daudé wrote:
> On 7/6/21 3:17 PM, Eric Auger wrote:
>> Add new tests checking the good behavior of the SMMUv3 protecting
>> 2 virtio pci devices (block and net). We check the guest boots and
>> we are able to install a package. Different guest configs are tested:
>> standard, passthrough an strict=0. This is tested with both fedora 31 and
>> 33. The former uses a 5.3 kernel without range invalidation whereas the
>> latter uses a 5.8 kernel that features range invalidation.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>>
>> ---
>>
>> v4 -> v5:
>> - Added the skipIf statement (William) and William's R-b
>> - added Wainer's R-b and T-b
>> ---
>>  tests/acceptance/smmu.py | 133 +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 133 insertions(+)
>>  create mode 100644 tests/acceptance/smmu.py
>> +    def run_and_check(self):
>> +        if self.kernel_path:
>> +            self.vm.add_args('-kernel', self.kernel_path,
>> +                             '-append', self.kernel_params,
>> +                             '-initrd', self.initrd_path)
>> +        self.launch_and_wait()
> IIUC above is the 'run' part and below is the 'check' part?
>
> So the check succeed if the VM booted, right?
>
>> +        self.ssh_command('cat /proc/cmdline')
>> +        self.ssh_command('dnf -y install numactl-devel')

For the test to succeed, the guests needs to boot, the ssh connection
needs to be established and  the dnf command needs to complete.
See launch_and_wait() in __init__.py

Thanks

Eric
>> +
>> +
>> +    # 5.3 kernel without RIL #
>> +
>> +    def test_smmu_noril(self):
>> +        """
>> +        :avocado: tags=smmu_noril
>> +        :avocado: tags=smmu_noril_tests
>> +        :avocado: tags=distro_version:31
>> +        """
>> +        self.common_vm_setup()
>> +        self.run_and_check()


