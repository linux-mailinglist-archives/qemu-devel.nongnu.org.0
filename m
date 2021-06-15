Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7DA3A8220
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:13:20 +0200 (CEST)
Received: from localhost ([::1]:51328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9od-0006II-K5
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lt9dH-0003C5-Ef
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:01:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lt9d4-0007ZW-4H
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623765680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r6tpQLyiKQWTpbURkWH3nEWOmP3T6P5ekrQSUtLkwmk=;
 b=NLbjDuyBVFV9+38Z5zcSmsG21j4gZdo9skwqearv4Drmyl5lMSRSi+ZZHKoAOxP49F/7Z8
 wtRAiDsBhP9TSUET8riOGWJZFU8Vtbvtq3EnyWfl4pxvZuWzc0Kse8ZOG3QXH75PyIk7jO
 po4KmvwO29oj6+bNJUvR3PyfqbP2JxM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-KBmwmQhDM56GQhBzRMVJxg-1; Tue, 15 Jun 2021 10:01:18 -0400
X-MC-Unique: KBmwmQhDM56GQhBzRMVJxg-1
Received: by mail-wr1-f70.google.com with SMTP id
 f22-20020a5d58f60000b029011634e39889so8631486wrd.7
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 07:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r6tpQLyiKQWTpbURkWH3nEWOmP3T6P5ekrQSUtLkwmk=;
 b=XO3StKU0HVFLJ1augbf1wqo7zl+V5vgkzdyjzW4C87E5X688moJD6NCywTMzjLOOv8
 4Ap9xJEcRlcQLZmqbVlc2tRGAKbF0cM30gNB/tIEbg9q+Kj5Bmn/twUZOhKUT66LRWnZ
 nZQazU0aFGJi6K88ID1EFZ89huA+GVYlaUt4jFL3ZZEWViGUPeaC4ZMpX1dQ7wb9HTOU
 JFh2Mr3nDZlJimD1KqQAdkZWzR4/X0o6kBzW4xPjfve8ClCtNsdblurVBj5PYk4BDHc2
 j79tXzoGddIDq167i0Nc4a6uqC6X6w5L7MwJY4mpAi/Ee0ufABdH74d8WtTr1vqWetDS
 uo8Q==
X-Gm-Message-State: AOAM531mu/q8v/cRrWPlrbPIqjHh+N0Fvdql70C3Iyauj4gl0yQOAOCI
 NyEQkffXWf1W4TBFOV1afauZsEoWd4SBryI+RWfcF9C3Ah1Mg+eQWW0IgEw30TMZE3ReWDyvQVW
 SVjuOAAVrOHCpTuA=
X-Received: by 2002:a05:6000:50d:: with SMTP id
 a13mr24646196wrf.130.1623765677437; 
 Tue, 15 Jun 2021 07:01:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQWJGTXI6noKyy/7XsD6fFJgTOTxRHu1sH56UgUbVcAOlmUPFovj5BCVJzNreIPusJpTh+Wg==
X-Received: by 2002:a05:6000:50d:: with SMTP id
 a13mr24646150wrf.130.1623765677307; 
 Tue, 15 Jun 2021 07:01:17 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id k12sm2351977wmr.2.2021.06.15.07.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 07:01:16 -0700 (PDT)
Subject: Re: [RFC] GitLab issue tracker labeling process: arch/target, os, and
 accel labels
To: Cornelia Huck <cohuck@redhat.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <0a19af15-2f34-4934-c6c9-113e49f5f1f2@redhat.com>
 <87k0mvy4b6.fsf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <273e559c-5944-5a9d-bfe6-248da5a66e56@redhat.com>
Date: Tue, 15 Jun 2021 16:01:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87k0mvy4b6.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/21 9:28 AM, Cornelia Huck wrote:
> On Mon, Jun 14 2021, John Snow <jsnow@redhat.com> wrote:
> 
> (...)
> 
>> # OS
>>
>> Currently "os: XXX" for BSD, Linux, Windows, and macOS.
>>
>> https://gitlab.com/qemu-project/qemu/-/labels?subscribed=&search=os%3A
>>
>> Multiple OS labels can be applied to an issue.

> What about linux-user? We probably can't categorize what is being run
> very neatly.

There is already a 'linux-user' label, usually paired with 'accel:TCG'
and the target arch:
https://gitlab.com/qemu-project/qemu/-/issues?label_name%5B%5D=linux-user


