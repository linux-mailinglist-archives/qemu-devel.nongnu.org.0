Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D3823099D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 14:11:04 +0200 (CEST)
Received: from localhost ([::1]:50814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0ORj-0002BM-Ew
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 08:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k0OQ9-0000ab-KK
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 08:09:25 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34380
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k0OQ7-0006bc-W5
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 08:09:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595938163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAMl1YqWORKKtOMekhyoaRBHMQBRCG/ZugNfrMjr7uA=;
 b=DALIB553jyqqSvoS6yEnwD9lcgQoRDA49Zy6IdKMYxSpc+jlxPAwZhIlalzq+Id1srX076
 6R5kJC9e3iOw2dsLxQ8tUefPqiJn4DulcPXRC2cQChxSfTbbEplQG7Rli3N3EcI4KtyIfg
 /86JDOdeBaFK+v0+OV3kwVNVA8PmeI0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-9B8EhZY5NOWFQ1JjMtKshA-1; Tue, 28 Jul 2020 08:09:21 -0400
X-MC-Unique: 9B8EhZY5NOWFQ1JjMtKshA-1
Received: by mail-wm1-f69.google.com with SMTP id b13so8777292wme.9
 for <qemu-devel@nongnu.org>; Tue, 28 Jul 2020 05:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CAMl1YqWORKKtOMekhyoaRBHMQBRCG/ZugNfrMjr7uA=;
 b=Fx+t5ypH89t3fXkga3deyzHTs9cZtq+6+r6aDuKyn/aMoWFZLeClbVDeJC74F7BNq7
 lBpLJuXs/+JcyiVr2WdCt7bbw8Hsuy4In6jQuNPGlbfz5Uh5u9uAPrwdF+ZainnlfnKA
 5b65ffz36BD+bl8ERd2rQ5vsvqvN40xPDATcx1Zxgcy9vp63vUxRoZNhhzj5RXnjF33p
 gEV/emyz/N5vtfmP311MTy35X8qByd0M3zRf/cmJXgXWf8/udAEHw9gMwtCA4DysYFji
 XZy/4YSfyaq1kJC4imW/baHU8MwCEp7UND3FAT2qFwCD0ndzAnZbjVySp4+mJ0zjnaXN
 DI4A==
X-Gm-Message-State: AOAM53020K+HCYU+ghdgUaiWqnl9E2hTfz8/OBbbHTDDgOSj5CLOuwbl
 QW1b2qbeJoM2labV1hDkLHglRRfXpa//9OZE5NaJo5mHpfhG83mOv8iFwy+s7ZnxtZzePd+jrXn
 iqBnIJx+WY99+As8=
X-Received: by 2002:a5d:5084:: with SMTP id a4mr25656044wrt.191.1595938160240; 
 Tue, 28 Jul 2020 05:09:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH/3OrB6m4we1AVkYmPwY+WTP7GEGAFuArMttTLh2a7XJzXLZNXQ/UjP+z4XnRZILSJhwJbA==
X-Received: by 2002:a5d:5084:: with SMTP id a4mr25656016wrt.191.1595938160003; 
 Tue, 28 Jul 2020 05:09:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:80b0:f446:bb61:1dbb?
 ([2001:b07:6468:f312:80b0:f446:bb61:1dbb])
 by smtp.gmail.com with ESMTPSA id a10sm4364863wmd.3.2020.07.28.05.09.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2020 05:09:19 -0700 (PDT)
Subject: Re: migration: broken snapshot saves appear on s390 when small fields
 in migration stream removed
To: Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Bruce Rogers <brogers@suse.com>, Claudio Fontana <cfontana@suse.de>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <8bbafdec-836d-b7de-cab8-7a325b6e238d@suse.de>
 <55c406cd-b9ca-4e9b-0acd-d33cfe2a70e3@redhat.com>
 <bf074240-8cc3-96ff-e95e-bd301822b756@suse.de>
 <ea3b617f-c2ea-534c-06ba-f5f9f43828a7@suse.de>
 <8125b1ff-373a-aadc-eccf-27c567007a27@redhat.com>
 <8ff7eeab-bef1-0957-a95c-72819680c431@suse.de>
 <1db6d502-73d1-5e3d-10d1-796d80ab8f07@suse.de>
 <13728e69-75a5-2edc-9ed3-6e08d94c722d@suse.de>
 <636bb3c4-2242-284b-30cd-299f447117c2@suse.de>
 <5f455e82e0a4f3662918dcdc85d1cfc5a3187896.camel@suse.com>
 <72ff33d4-653f-5702-fc04-9090653ab782@redhat.com>
 <ee1fa866-6d7d-bb7c-e811-4d94d9aa3459@virtuozzo.com>
 <dc30924a-11f8-f452-837e-ae5ee7ec9cc1@redhat.com>
 <0e175bbb-6d5e-f509-7a4f-e3e4769c13a1@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1c3c876b-6f33-62e9-ace3-7f83e62ceea2@redhat.com>
Date: Tue, 28 Jul 2020 14:09:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <0e175bbb-6d5e-f509-7a4f-e3e4769c13a1@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 00:06:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Jason J. Herne" <jjherne@linux.ibm.com>, Fam Zheng <fam@euphon.net>,
 Liang Yan <lyan@suse.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/07/20 13:45, Max Reitz wrote:
>> Is it possible to make a quick testcase using qemu-io?
> This seems to work:
> 
> $ qemu-img create -f qcow2 -o cluster_size=512 base.qcow2 512
> $ qemu-img create -f qcow2 -o cluster_size=512 -F qcow2 -b base.qcow2 \
>   top.qcow2 1024
> $ qemu-io -c 'write -P 42 0 512' top.qcow2
> $ qemu-io -c 'read -v 0 1024' top.qcow2
> 
> That should print 512 times “2a” and then 512 times “00”, but beyond
> 512, the buffer stays uninitialized; instead, the first 512 bytes are
> zeroed.  (With the patch, it works as expected.)
> 

Wow, that's great (and a good recipe for qemu-iotests too).  Thanks.

Paolo


