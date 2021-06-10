Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401FB3A2C96
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:12:57 +0200 (CEST)
Received: from localhost ([::1]:54396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKUO-0002T3-HN
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrKSp-000160-JU
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:11:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrKSn-0006F7-Ht
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623330669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lyPn+j+fAlirLOFMMuLWIUThFlfXTNfvnnPnIuVm82A=;
 b=OO/+82Q2D6R6AR5mXPJ+qbuwf9+2Blmhe0x5vGPayetKUhZAfN1jcV1H1JspAPwkgqNOxb
 dPb7piU7NoJzf9W+ksPYHAEOxKWO9NbavBPciMGMmOTeSEXmpB/MtMkrK6PyTysvqKyLC+
 /trzLfYYVZ/nwlORyKy+EICp4sYHLU8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-VXpg4SraNYemUg2O4PX8Yw-1; Thu, 10 Jun 2021 09:11:07 -0400
X-MC-Unique: VXpg4SraNYemUg2O4PX8Yw-1
Received: by mail-wm1-f72.google.com with SMTP id
 n2-20020a05600c3b82b02901aeb7a4ac06so3777376wms.5
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lyPn+j+fAlirLOFMMuLWIUThFlfXTNfvnnPnIuVm82A=;
 b=iKK5O5Q+6CpFFhdcCsVNRYMcTvt67jI1D7pTXSI+emd3Hal36sJnKt8epji7ikdULK
 XU/4DkDzTkiINEk59KyVMIViKUUn8rcjCICFlvIWBgw9cnBK2Z9ulMLxU/8toJ+6Yj8I
 dTjvF7OqTYJmZmvWnm0Do3xbZn+K9j9CL4+Ac2aMq0CKMV0icDDE5AeEwA6T2WG+mBs1
 3kDcTE4bX8ZmS2TIn2mJjX5LoAZ0uQgpplwF2oIl/VYIYSuH/FmyTA0UuDF8O+G1nh/X
 krBZPr7R+WmoqBjt44MKbaRnVpD5Fbp+Adb5H+gXWHA15/EQoOo8+MnhO8I+fjJsLII3
 mFTg==
X-Gm-Message-State: AOAM532sdS55kG7JGfKqGZdBy2fopyXMl2w+v/hH7Y4607nUoyy+mwTG
 h9FkUF5OSBmFetb2Ei9W5fniduiTiyBW1RJx5S3y0stXZIg/B2HFjFH3jFQpdNZQnhxWpq/qpfL
 RiaXy6zalu8M4LMg=
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr5404711wru.77.1623330665878;
 Thu, 10 Jun 2021 06:11:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFdlt5RlWGIbVd1md1ATOpsOODFXceb/FOnCktBKtcN+iga3+6hU47YQmAsZxThblN3ashNQ==
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr5404682wru.77.1623330665695;
 Thu, 10 Jun 2021 06:11:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id o7sm3825084wro.76.2021.06.10.06.11.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 06:11:05 -0700 (PDT)
Subject: Re: [PULL 00/12] Machine and OS X changes for 2021-06-08
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210608094017.392673-1-pbonzini@redhat.com>
 <YL8+/iTU/VrJ7oFE@redhat.com> <87czsugtr7.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8101172b-97b1-f61b-f513-53afc7e3dca0@redhat.com>
Date: Thu, 10 Jun 2021 15:11:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87czsugtr7.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: "Zhong, Yang" <yang.zhong@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/06/21 07:42, Markus Armbruster wrote:
>>> ----------------------------------------------------------------
>>> Paolo Bonzini (12):
>>>        qom: export more functions for use with non-UserCreatable objects
>>>        keyval: introduce keyval_merge
>>>        keyval: introduce keyval_parse_into
>>>        vl: switch -M parsing to keyval
>>>        qemu-option: remove now-dead code
>>>        machine: move dies from X86MachineState to CpuTopology
>>>        machine: move common smp_parse code to caller
>>>        machine: add error propagation to mc->smp_parse
>>>        machine: pass QAPI struct to mc->smp_parse
>>>        machine: reject -smp dies!=1 for non-PC machines
>>>        machine: add smp compound property
>>>        vnc: avoid deprecation warnings for SASL on OS X
>>
>> None of these changes have any reviewed-by tags.

All of them however have been on the list for one to six months; the 
most recent post is 
https://patchew.org/QEMU/20210513162901.1310239-1-pbonzini@redhat.com/, 
but indeed I haven't posted a new version after rebasing on top of the 
recent -object bugfixes.

> PATCH 03 looks unfamiliar, so I checked: it hasn't been posted before.

The code was posted for the first time 6 months ago 
(https://patchew.org/QEMU/20201202090305.4129317-1-pbonzini@redhat.com/20201202090305.4129317-18-pbonzini@redhat.com/), 
though parts of it have been progressively separated and merged.  But 
indeed, the part that's left and that is included in this pull request 
hasn't been posted separately.  I'll do so now.

> Seems likely; I very much doubt Paolo would be trying to pull a fast one
> on us ;)

Not voluntarily, at least!  Sorry about that, I mis-remembered the order 
of the two series (which is now getting a bit more urgent, because Yang 
Zhong would like to use array properties in -M for SGX).

Thanks,

Paolo


