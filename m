Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A732F3418A7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 10:43:18 +0100 (CET)
Received: from localhost ([::1]:43410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNBf3-0003nG-OG
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 05:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNBdi-0002u8-9Q
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:41:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNBdg-0007Iv-4c
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616146910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e3qfCzOQdneNzh0cNJd42CQUjSdBw/mhJ9vgjRUb3b0=;
 b=hvuffN2dlAUExK7mc+NHgbCSwt44djRdmOboeJEs2iJYSatQcw+oNBojNTeoxThH7PchMc
 2hPC7KIbXzJ42ztLi+nBSVntcS5N/h1V7L4AZZ0D1uOGobMC9e8z6ixem1vbxJSHw43dJ4
 nTQlLHkATcZ7UdNgi3jAR400DuPpr9Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-MlPRsNPQP3mRrTllD2SoiQ-1; Fri, 19 Mar 2021 05:41:49 -0400
X-MC-Unique: MlPRsNPQP3mRrTllD2SoiQ-1
Received: by mail-wr1-f71.google.com with SMTP id r12so21583307wro.15
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 02:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e3qfCzOQdneNzh0cNJd42CQUjSdBw/mhJ9vgjRUb3b0=;
 b=gKDQkx+SNHfnt8YlDLg/oP+XL/OmD4G4MKwS1X0SA1FNebBrTsaH9V/QgGHDhmqgQd
 zcnv4pmKpYoCKyodZWzHrLRipSu5ZflQv+0zstXcjlx0O4y/jNCGTSW8rwVK68WWNoDf
 9QAy8SFut5NGNhUY1Yj5JSXRwY36t80SLINc2NiVJTNDGHh+VT8E7lV6Q4evgnB1pcOv
 e00AJUq3EvQ2Ivwhhht/xswEde5hWegnj5Q4tqz8L8C45hwFrEpEUeakO1GaQapenyM/
 /1pNwj7hPPWE0OW9+5BlzYZeZU7lLeCR93Epa/X8XVuDJHZeC+ER83H6VqIfVbLph4bY
 4GnQ==
X-Gm-Message-State: AOAM530wj6Hn5TOrSHa5yBJWeaS78nUZTV7MDZorR+7owtrHzud0/8+W
 1AAYEdVJIPg3U1tUsxHTBHnhY4wDb5cnWDhxl7cOvEwBclXJzPVKih6qdhqgFC9RPzCM8LHqH2J
 tUe/xsx3WSmbtnMKiSZwE0RUAhH5cTHKtbGYSVFoJjAI7vHiFtca/Ep/CaJwFekS/Igk=
X-Received: by 2002:adf:f94c:: with SMTP id q12mr3492489wrr.283.1616146908033; 
 Fri, 19 Mar 2021 02:41:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxatrxHdjXv15huYp9HPjAM+kTnCY1LezJ65xQmN2SwRgeNOl74X4SmTcouOM6HTS0vUZDE9g==
X-Received: by 2002:adf:f94c:: with SMTP id q12mr3492464wrr.283.1616146907724; 
 Fri, 19 Mar 2021 02:41:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u2sm7282132wmm.5.2021.03.19.02.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 02:41:47 -0700 (PDT)
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Serious doubts about Gitlab CI
Message-ID: <ea7bf28e-c0e2-8350-04be-b7052c2238ee@redhat.com>
Date: Fri, 19 Mar 2021 10:41:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/03/21 10:33, Stefan Hajnoczi wrote:
> On Thu, Mar 18, 2021 at 09:30:41PM +0100, Paolo Bonzini wrote:
>> On 18/03/21 20:46, Stefan Hajnoczi wrote:
>>> The QEMU Project has 50,000 minutes of GitLab CI quota. Let's enable
>>> GitLab Merge Requests so that anyone can submit a merge request and get
>>> CI coverage.
>>
>> Each merge request consumes about 2500.  That won't last long.
> 
> Yikes, that is 41 hours per CI run. I wonder if GitLab's CI minutes are
> on slow machines or if we'll hit the same issue with dedicated runners.
> It seems like CI optimization will be necessary...

Shared runners are 1 vCPU, so it's really 41 CPU hours per CI run. 
That's a lot but not unheard of.

Almost every 2-socket server these days will have at least 50 CPUs; with 
some optimization we probably can get it down to half an hour of real 
time, on a single server running 3-4 runners with 16 vCPUs.

Paolo


