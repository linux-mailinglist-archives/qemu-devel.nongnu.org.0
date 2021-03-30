Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C2E34E4FC
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 12:01:25 +0200 (CEST)
Received: from localhost ([::1]:60678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRBBc-0007pn-IJ
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 06:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRB9b-000794-LA
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 05:59:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRB9Y-0001sl-9l
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 05:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617098353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GU1+X9cgyUlBUWoi+rJ6SgDL8PJ4VCE3wHDb+5PsSc4=;
 b=bay64SFEhcWUIMKDRl6DbJfKfb3WwyLh3M8T9z1xXPKsTQcSMP6FzWHEX9JO/J5f95kMoO
 XPvGWsK8/kXcDNFQO3tvBNUOpyrw49kYtuupc2kyhtrTCO1FphcBz3xr8ndMDk9tgOx+TJ
 c7m/u+hLst4+TV1CS3ppQ/3UzdhnZMQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-ntO9qvAdPGKv2OQfxc46vQ-1; Tue, 30 Mar 2021 05:59:11 -0400
X-MC-Unique: ntO9qvAdPGKv2OQfxc46vQ-1
Received: by mail-ed1-f72.google.com with SMTP id bm8so9930349edb.4
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 02:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GU1+X9cgyUlBUWoi+rJ6SgDL8PJ4VCE3wHDb+5PsSc4=;
 b=XEP/8TAm3u7jyrgRG7vYUVw3zHlnwvR8Ad2zoMIrpNsMiGaEP4DQRiLQ/f9cB/RUAx
 G10uYB4pULWdvrfY/8GBfruyhPuQD41b6JJKlUvWl+qsfDaR7qVQlmpuuVv0hKOS+L1V
 qFFF2WVX4j5ovYWLlLqvqOmefdDQeeVM3zvOs/zsvCy9MGCa8WkZ0V8u+5T6zm+qSi0E
 UKjn3FRhf1S0rZ2HtdFTejwxeaO1BNWX4HmNFs8f3OJ8LlxItd1RTfwJm7SPFpEs8qXp
 fTZ1NHffTNPgG7FApLgBJNLXvwOXdTvsJsshFpCkYVrEn0oEKzr9IBIuDn2s46pxAC2R
 K63w==
X-Gm-Message-State: AOAM530Si7TvKJw5kmHqNK2ZMxGYWyaJZ8O2wcHbAYirVBGYRBRDhii0
 GUMKhLO7lyE2UTyfMkWQ+jpAddjeDoNPBIRCBr4SFo79s49r6yCJyDdDg4UmTtsSWtlmOC/jgKs
 1LZO82NOQ9ulIQ0A=
X-Received: by 2002:a17:906:3952:: with SMTP id
 g18mr32490284eje.104.1617098350489; 
 Tue, 30 Mar 2021 02:59:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJTCgq7hmcn8qinrLJFvsY7SYvf/gcDpkxtZjTBxRPAkCS8eMHfJk8hx34sbXti4PNwiYvfw==
X-Received: by 2002:a17:906:3952:: with SMTP id
 g18mr32490266eje.104.1617098350250; 
 Tue, 30 Mar 2021 02:59:10 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u1sm10598333edv.90.2021.03.30.02.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 02:59:08 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210329180140.2761383-1-thuth@redhat.com>
 <YGIdduioIxRIxMMp@redhat.com>
 <CABgObfbyDTNyww5QE-tOsBVfkZVziX3uwGJCN+7mrXOQ_ZuHFg@mail.gmail.com>
 <0d20369b-1f2e-1ac6-fb7e-556453ce5666@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict Resolution
 Policy document
Message-ID: <538be5a1-4396-71eb-30ff-1501040190f7@redhat.com>
Date: Tue, 30 Mar 2021 11:59:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0d20369b-1f2e-1ac6-fb7e-556453ce5666@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/03/21 09:13, Thomas Huth wrote:
> Contributor Covenant 1.x is certainly an option, too, but it has IMHO 
> already quite rigorous language ("Project maintainers have the [...] 
> responsibility to remove, edit, or reject comments, commits, code, wiki 
> edits ...", "Project maintainers who do not [...] enforce the Code of 
> Conduct may be permanently removed from the project team."), which could 
> either scare away people from taking maintainers responsibility or also 
> could be used fire up arguments ("you are a maintainer, now according to 
> the CoC you have to do this and that..."), which I'd rather like to avoid.
> (well, as you know, I'm not a native English speaker, so I might also 
> have gotten that tone wrong, but that's the impression that I had after 
> reading that text as non-native speaker).

I see your point.  We also have the issue that mailing list archives are 
basically immutable and maintained on Savannah.  It would be hard for 
anyone to remove problematic language in many cases.

My first review last night focused on the conflict resolution policy 
because I was obviously more familiar with it.  I have now reread the 
code of conduct more closely and I like it, both the original and the 
small changes you made to the Django code of conduct.

I do have a couple remarks:

* like its ancestor, it is still erring on the opposite side by not 
identifying who is responsible for having a welcoming community, which 
goes beyond remediation.  Maintainers do have _some_ responsibility in 
that respect, and it should be mentioned somewhere.

* this sentence could be seen as making QEMU responsible for acting 
based on what people say on Facebook or Twitter:

> In addition, violations of this code outside these spaces may
> +affect a person's ability to participate within them.

I don't want to open that can of worms; not now at least.  The conflict 
resolution policy already calls out specific exceptions as a consequence 
of CoC violations, and I think that's enough.

As you're the one doing the work I don't want to impose my view, but I'd 
like to ask you to consider at least the following two changes:

* replace the above sentence with "This code of conduct also applies 
outside these spaces, when an individual acts as a representative or a 
member of the project or its community".

* in the paragraph after it ("If you believe someone is violating the 
code of conduct...") prepend the following text from the Contributor 
Covenant: "By adopting this Code of Conduct, project maintainers commit 
themselves to fairly and consistently applying these principles to every 
aspect of managing this project".

(On top of this the "When we disagree, try to understand why" bullet is 
somewhat redundant with both the conflict resolution policy and other 
parts of the code of conduct, and I like such documents to be as short 
as possible.  But that's more cosmetic than normative, so it's not a big 
deal).

What do you think?

Thanks,

Paolo


