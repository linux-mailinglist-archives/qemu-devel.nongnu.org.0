Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC9D4E2F08
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 18:27:30 +0100 (CET)
Received: from localhost ([::1]:59644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWLoX-0004xB-6j
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 13:27:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWLnN-00044i-DV
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:26:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWLnK-0000qN-CC
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:26:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647883573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lky1zqh23Y3W+XeVpHKfh88WoT48CLmirq4lNusbQKY=;
 b=eV6Q0nhqre8tD1G3iaiKrtBQM3Z6yucJ53lZilpez6n8ZwkxYum7noQX2MVoM3VzLCSpva
 HJXWf/Jsj6Z/lU3rb1ZkBrw+1JBeTpf3ntdx9rcejofS1S52k3fh43hIs3+KiY229tAnI0
 oUWIKeKlNW171ebSiirpEC6HSjZgeQw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-U-l-Shr7NWuu1J29O8eN5A-1; Mon, 21 Mar 2022 13:26:10 -0400
X-MC-Unique: U-l-Shr7NWuu1J29O8eN5A-1
Received: by mail-wr1-f71.google.com with SMTP id
 88-20020adf8161000000b0020410a1bd93so659518wrm.0
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 10:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lky1zqh23Y3W+XeVpHKfh88WoT48CLmirq4lNusbQKY=;
 b=iqmtWlCuJFo+Y5tQOcs1SjREwoMY5mWyJkseiWksYB4ck50Y6LZ3kBT+ptL++iexmM
 sPg9j45BLOoxbiEAPKYl0Y1kfhS+XZUIENxmEfIrX0iPRP5Pq6ExXaQMMvnu05rRHSHp
 /QQlinCgCUWWKFq3rH+9uaq8d7c8rCgk1DqsQqVTrJ/jH4EjjYeKd9iV0xys/yqzFhmc
 bAzJISIFNUg4G86dF67a5Crjbc3G5b+KCE8DWNRPoByLsvEfOPnuygHaKa8hjdD5e4+5
 rklwF91jpDkTDoDg6894AOmLIpPxbVEQM/JcRG/R8X/zYFZBBvgx5fP7PFRocFfgW3mD
 8Vqg==
X-Gm-Message-State: AOAM531LooEPPzrRWMcH1EFEcHImaxyspgDm4n08w5CL7jfwGZWsji7q
 kbGj5bLPWbP5y1Zp42tuIHDCPcxYFlShG5vz7+aJRQir4AGJuHtD2FYyjw6+7pt7W2N2QU1TRlk
 E7K+Nu02dWSXvOl4=
X-Received: by 2002:a5d:6510:0:b0:204:a6f:1226 with SMTP id
 x16-20020a5d6510000000b002040a6f1226mr6471517wru.59.1647883568808; 
 Mon, 21 Mar 2022 10:26:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiToL7tXYLTkeWrE+taxfqvtfiXe7j3aSb+Wl4wM0WbG04laILdoVEptOhBrB7tEH/xrWpHQ==
X-Received: by 2002:a5d:6510:0:b0:204:a6f:1226 with SMTP id
 x16-20020a5d6510000000b002040a6f1226mr6471495wru.59.1647883568574; 
 Mon, 21 Mar 2022 10:26:08 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 b3-20020adfd1c3000000b00203f94379a4sm9125258wrd.67.2022.03.21.10.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 10:26:07 -0700 (PDT)
Message-ID: <b9dd43ca-0120-a27b-823a-a88572be94c6@redhat.com>
Date: Mon, 21 Mar 2022 18:26:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 0/4] Improve integration of iotests in the meson test
 harness
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20220223093840.2515281-1-thuth@redhat.com>
 <f71c35ff-1db2-7491-c9fe-a0dd3ab1cbee@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <f71c35ff-1db2-7491-c9fe-a0dd3ab1cbee@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/03/2022 17.14, Hanna Reitz wrote:
> On 23.02.22 10:38, Thomas Huth wrote:
>> Though "make check-block" is currently already run via the meson test
>> runner, it still looks like an oddball in the output of "make check". It
>> would be nicer if the iotests would show up like the other tests suites.
>>
>> My original plan was to add each iotests individually from meson.build,
>> but I did not get that done reliably yet [*], so here's now a cut-down
>> version to improve the situation at least a little bit: The first three
>> patches are preparation for the clean-up (long-term goal is to get rid
>> of check-block.sh, though we're not quite there yet), and the final
>> patch adds the iotests not as separate test target in the meson test
>> harness anymore. This way, we can now finally get the output of failed
>> tests on the console again (unless you're running meson test in verbose
>> mode, where meson only puts this to the log file - for incomprehensible
>> reasons), so this should hopefully help to diagnose problems with the
>> iotests in most cases more easily.
>>
>> [*] See v2 here:
>>      https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg01942.html
>>
>> Thomas Huth (4):
>>    tests/qemu-iotests: Rework the checks and spots using GNU sed
>>    tests/qemu-iotests/meson.build: Improve the indentation
>>    tests/qemu-iotests: Move the bash and sanitizer checks to meson.build
>>    tests: Do not treat the iotests as separate meson test target anymore
> 
> What’s the status of this series?  I wonder why you split it apart, mainly.

I've mainly split the fourth patch apart since Paolo mentioned that the 
commit message should mention the meson bug (IIRC), and  since QEMU was 
entering soft-freeze, thus I doubt that a patch like "Move the bash and 
sanitizer checks to meson.build" is still acceptable at this point in time. 
The meson.build clean-up is rather something for 7.1 instead.

> Patch 1 was already merged, and I took patch 4 today.  So what about patches 
> 2 and 3?  They look sensible to me, but is this series still relevant and 
> fresh, considering you sent new versions of patches 1 and 4?

If you think they are still ok for 7.0, you can certainly also pick the 2nd 
and 3rd patch ... otherwise I'll respin them later for 7.1.

> (And are there any other iotests patches from you that flew under my radar?)

There's my "Supply a test plan in TAP mode" patch on the list, but 
apparently you already found it :-)

Thanks!

   Thomas


