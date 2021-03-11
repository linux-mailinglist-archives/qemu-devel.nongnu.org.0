Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DB8337951
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:29:48 +0100 (CET)
Received: from localhost ([::1]:32936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKOC3-0007lu-5n
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKO0m-0004Bo-36
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:18:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKO0k-0002gg-6X
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:18:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615479485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LrADqJeed8uGCxsGNZ4KUfZ7NLuQoNuxyycdjUUjj58=;
 b=ejaxfnJ3giCQ58OEl9EdSg+s1a2on26W/iw3Upuyp2wMJ3sNQ6L4QapAtoH01sqq2TYkmF
 pZDw6lIjuZlChHkd42Fj35mopnkJedVB+q26rZwf515nTH8EeBwaAZmHv5dcpwZCDeCVvU
 jtYQjSTagVP8vbIRANW0Ij9qBB4v03c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-443dDtcjNAu77wrEEvaSpA-1; Thu, 11 Mar 2021 11:18:03 -0500
X-MC-Unique: 443dDtcjNAu77wrEEvaSpA-1
Received: by mail-wr1-f69.google.com with SMTP id n17so9748090wrq.5
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 08:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LrADqJeed8uGCxsGNZ4KUfZ7NLuQoNuxyycdjUUjj58=;
 b=LM/tM+nwH1GeTBPaLlPyioTZxpIBlMlApB5HLw7lMfDL3ihOoTt0pcmJ/bmhT8jk0F
 D+YTLROXaf5hmlLN4G8rL6SV2D0/djX2Qv3yimDKuqgtVru7dHAzZETQARLQ+LmQuGMZ
 W/c3IJbsmjyX1/WMxe3NqIW0vJWGD45Dw3mMG12u4O6UHnhxdNhCWRde3g7X0OGpeuOe
 k00xEw63n02Hxho8aRwh4ebKGEWhahE6n55g1DaSUUt+7T0tSw2ZMJ+XU8Ys9wtxumAW
 LkF1VhB8RV6pHjNtdeuwQW/tPmazBIwMudQcAlVN+89prJtmbZHDsknQDHiBhe3OPJzl
 OfMw==
X-Gm-Message-State: AOAM531mzVR4YM5dRYb2kbWCwmkOocd7uVpcnYYbtr94c0PeLPM0e0zO
 lBmtKClC1X1Rh6UD0NBhK0C6YCDChewx2AkzobnSOVRYPd6tjwJ2w1G0WdKM4M1AMduphFJAaLf
 RIdyEzpQBxx6Kep0=
X-Received: by 2002:adf:9bd7:: with SMTP id e23mr9397602wrc.48.1615479482381; 
 Thu, 11 Mar 2021 08:18:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOZTviQrERawo6z8OohtOphoV9nHrZ+PA+RPVheYPszSweZQlYoYlTnUAz66dUdI/V2mb1BQ==
X-Received: by 2002:adf:9bd7:: with SMTP id e23mr9397562wrc.48.1615479482009; 
 Thu, 11 Mar 2021 08:18:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i8sm5047429wry.90.2021.03.11.08.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 08:18:01 -0800 (PST)
Subject: Re: arm: "max" CPU class hierarchy changes possible?
To: Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
References: <11e9d3bb-c94c-4ad7-35b0-b698376c5e00@suse.de>
 <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2e6a5d98-e022-0b39-5f30-92eb74491d3b@redhat.com>
Date: Thu, 11 Mar 2021 17:18:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/03/21 16:02, Peter Maydell wrote:
> On Thu, 11 Mar 2021 at 14:27, Claudio Fontana <cfontana@suse.de> wrote:
>> the "max" cpu in x86 and s390 is a class,
>>
>> and then "host" has "max" as parent.
>>
>> This would be a convenient setup for ARM too, as it would allow to put common code between kvm and tcg in the "max" class,
>> and allow "host" to specialize the behavior for KVM (and in the future HVF probably).
>>
>> Would changing the class hierarchy this way be acceptable, cause any problems?
> 
> It's not clear to me why 'host' would be a subtype of 'max':
> that doesn't seem like an obvious relationship.

On x86, "-cpu host" is essentially the same as "-cpu max" with the only 
difference that it errors out on TCG.  So:

- with TCG: "-cpu max" enables all that can be emulated, "-cpu host" fails

- with KVM: "-cpu max" enables all that can be virtualized, "-cpu host" 
does the same

Paolo


