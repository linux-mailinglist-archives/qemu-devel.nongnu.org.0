Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C787E440151
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:32:08 +0200 (CEST)
Received: from localhost ([::1]:48728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgVjb-0004Zt-Tt
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgVGb-0002LY-Mo
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:02:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgVGZ-0000DS-Ii
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635526925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l61e4UUoKuVIbatu5ZZe8sJXkhqpx6NaozD7+R6WTYI=;
 b=Mny7U8vueiog/6FDSlj25E80prmuxbg2dKP2gOVY8lP6ElROBokLb6ZZGjrloBMPVzuPTf
 zMKkWvT9zi2yaLOetRlZ3AY2wH4ILKhwcyhIjqTczpPFh43u4D6wGVgBWffpiarP9Bgi6n
 B5QLhi46fDQrmGfBsB42i2kvnodqK6c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-_SvmE4etNcKz52SGlD2d-g-1; Fri, 29 Oct 2021 13:02:01 -0400
X-MC-Unique: _SvmE4etNcKz52SGlD2d-g-1
Received: by mail-wr1-f72.google.com with SMTP id
 c4-20020a056000184400b0016e0cc310b3so3601092wri.3
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 10:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l61e4UUoKuVIbatu5ZZe8sJXkhqpx6NaozD7+R6WTYI=;
 b=tBQu7lT1MyGbhg9Y5SfuCiutVvC65yU9udHCHbvKWFZL9EgiOtKwuZzsxMa/SRcqVM
 qY4tNKVwzj4GRF9HBFZe/3K4TbbnA1cg9qogbRpB53nQppT1smliYKIu4h/gXDjQUzAe
 0fsT2KzJElfglMU0ER1EDBVWGmTAa+smWdmthPUruADyA4uR+IysJf19jjlnEtoj/t0U
 8qsm9OpVDsofegL5S776sgXLBltETuQA/rYPBI86g0L/Hlema2vlj3dWw3t+Kc6EV6xN
 qG1VLZUFMjRNKk0v3BVRqGecC1sdDBwM+hbWmQj3ucku/PnbQsEG16zoHXEQCY+hz3jA
 c7UA==
X-Gm-Message-State: AOAM533fPZEOMoJQUj4f6Q7EQJ4YLqhdbpWfmUHR0kz85a0Z4/0xl6tU
 yIievij2eFg6aKkZy5DdKftScKyNccxAF83D1wcNbHCYEZwCp1BbY9/nf3vbvACrVBlG2QbbbNk
 ciC5tncwMNslul4A=
X-Received: by 2002:adf:f786:: with SMTP id q6mr3312230wrp.356.1635526920153; 
 Fri, 29 Oct 2021 10:02:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSTT2oELGGpeLtF6J/mk5L/l5i1ejgRmTUjfD/T/x38D0joj+qxJp7ZUrN+Hrcakq3zMeMSA==
X-Received: by 2002:adf:f786:: with SMTP id q6mr3312197wrp.356.1635526919943; 
 Fri, 29 Oct 2021 10:01:59 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p12sm6799025wrr.67.2021.10.29.10.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 10:01:59 -0700 (PDT)
Message-ID: <215ee2c1-6347-98db-f4ae-8c8a907a01eb@redhat.com>
Date: Fri, 29 Oct 2021 19:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 8/9] qapi: Factor out compat_policy_input_ok()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211028102520.747396-1-armbru@redhat.com>
 <20211028102520.747396-9-armbru@redhat.com>
 <87o877ahze.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <87o877ahze.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.512, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, kchamart@redhat.com,
 mdroth@linux.vnet.ibm.com, dgilbert@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 18:55, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
>> The code to check policy for handling deprecated input is triplicated.
>> Factor it out into compat_policy_input_ok() before I mess with it in
>> the next commit.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/qapi/compat-policy.h |  7 +++++
>>  qapi/qapi-visit-core.c       | 18 +++++--------
>>  qapi/qmp-dispatch.c          | 51 +++++++++++++++++++++++++++---------
>>  qapi/qobject-input-visitor.c | 19 +++-----------
>>  4 files changed, 55 insertions(+), 40 deletions(-)

>> +bool compat_policy_input_ok(unsigned special_features,
>> +                            const CompatPolicy *policy,
>> +                            ErrorClass error_class,
>> +                            const char *kind, const char *name,
>> +                            Error **errp)
>> +{
>> +    if ((special_features & 1u << QAPI_DEPRECATED)
>> +        && !compat_policy_input_ok1("Deprecated",
>> +                                    policy->deprecated_input,
>> +                                    error_class, kind, name, errp)) {
>> +        return false;
>> +    }
>> +    return true;
>> +}
>> +
>>  Visitor *qobject_input_visitor_new_qmp(QObject *obj)
>>  {
>>      Visitor *v = qobject_input_visitor_new(obj);
> 
> I'm moving the new functions along with @compat_policy to qapi-util.c,
> so the QAPI visitors survive linking without qmp-dispatch.o.

OK. I am waiting your series to get in before respining my QAPI
sysemu/user series which will re-scramble meson.build here.
Probably too late for this release. Not super important, it just
saves energy avoiding generating / building unused files.


