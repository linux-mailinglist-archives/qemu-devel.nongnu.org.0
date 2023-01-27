Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1D467DE9E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 08:38:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLJI0-0003N0-59; Fri, 27 Jan 2023 02:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pLJHy-0003JJ-59
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 02:36:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pLJHw-0005Xd-Ig
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 02:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674805003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7o53KvIzLLHyPUBqRC3XGGZAyApeB8zcny04cnW5khc=;
 b=BJ114tb+/W88tWLn3bt65YS0ZwjuEkW1MwgHGFjSvJtNWZbYZTE5/AEcghUuU0RKoBDebq
 exfAEkPM5+z8oLtN4VVCvkY/COOiIjCNYzXFWE7mw5Z72+qW0X9eykJdDNXB+kGfotRJRm
 CdbueabSmDeucM3oCQkDNnSswgd4wkA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-3RpA_gymMW6lx9rxkTbBoA-1; Fri, 27 Jan 2023 02:36:40 -0500
X-MC-Unique: 3RpA_gymMW6lx9rxkTbBoA-1
Received: by mail-qv1-f71.google.com with SMTP id
 j12-20020a056214032c00b0053782e42278so2020266qvu.5
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 23:36:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7o53KvIzLLHyPUBqRC3XGGZAyApeB8zcny04cnW5khc=;
 b=RI8kJOmIH+NSDzTnrtRqF399rsRvck5zhlgi0ZJYiE4syyaTHW9qaF4/f3bW02E0x2
 LMJrtOPpF40jDQ8dJhIRzCnwKFMWfEiYCOYdnamK/IutyMWqiao9vBtVe8XCoAAbiEEi
 YgnvH+EqybtjFwh4vQVEEd6eAbVrQlcw1cWWssM4PSC1dctTTqmf9grbNLKwe67i4Uby
 dSHsRUbC66fKiW9QUlqeUyN8N8NiPRwO5mFCE+LPsNm8vzLhjLtfM4BT3D6nnP9aDVq6
 6GqLByKLDsnw+iA9GQaZajsT0ZafOdDUflTQn6GvpYLTeOEQ4B3izfP5MTt+Ae4PM4Mt
 g+qw==
X-Gm-Message-State: AFqh2kq4X9lcZrifdx5E6oyJVQwpWdMaT8HKG/kywczZrDaQOC8jdWaw
 4i/ZpNNM9s6fheth4ZawenitXN+L6WKWM1pNJbXHfS8/EceRA42Tbms64bfsdGCT0rKX7Sgl7w+
 /tzgeW4qy/1QfcOo=
X-Received: by 2002:ac8:45ce:0:b0:3b6:2e75:c9bd with SMTP id
 e14-20020ac845ce000000b003b62e75c9bdmr50613742qto.1.1674805000034; 
 Thu, 26 Jan 2023 23:36:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtd4UJBhMJioxooBsY4CI67Wy0JoT5YLq4NRfe9pUmdQ1NppdOTuGCi/xkQLdpBEGTmj1045g==
X-Received: by 2002:ac8:45ce:0:b0:3b6:2e75:c9bd with SMTP id
 e14-20020ac845ce000000b003b62e75c9bdmr50613729qto.1.1674804999773; 
 Thu, 26 Jan 2023 23:36:39 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-44.web.vodafone.de.
 [109.43.177.44]) by smtp.gmail.com with ESMTPSA id
 r21-20020ac84255000000b003b635009149sm2209371qtm.72.2023.01.26.23.36.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 23:36:39 -0800 (PST)
Message-ID: <f8103684-f07f-45fc-b51d-f39ecff8016e@redhat.com>
Date: Fri, 27 Jan 2023 08:36:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: no more pullreq processing til February
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <CAJSP0QXC3z-UyP5HoVTOmAfyz_vV6cpZJvnTYazWq9=52bndpA@mail.gmail.com>
 <CAFEAcA_CJ3VjHx1GhjBJjCY=+twBZM3UnR_g0sZLJhvVLcY=GQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA_CJ3VjHx1GhjBJjCY=+twBZM3UnR_g0sZLJhvVLcY=GQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.15, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 26/01/2023 15.28, Peter Maydell wrote:
> On Thu, 26 Jan 2023 at 14:25, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>
>> Are you batching pull requests? I used that approach last release
>> cycle. CI takes so long to run that I didn't want to run it for every
>> pull request. Batching worked well overall.
> 
> No, I just do one test per pullreq. IME the CI is flaky
> enough that I don't really want to batch it up, and it
> isn't so slow that I build up a backlog of unprocessed
> requests.

Just an idea: Maybe you could at least batch up the PRs from the people who 
have their repo on gitlab.com and already use the gitlab CI? ... in those 
cases you can be pretty sure that at least a huge part should pass the CI. 
(and if you're worried about the non-x86 hosts, you could ask the 
maintainers to supply an URL to Travis builds, too - we still have the 
possibility to test s390x, ppc64le and aarch64 there)

  Thomas



