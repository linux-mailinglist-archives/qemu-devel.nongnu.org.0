Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EE3643E18
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 09:09:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2T0i-0005aE-4d; Tue, 06 Dec 2022 03:09:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p2T0d-0005Zj-Rb
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 03:08:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p2T0c-0003az-Af
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 03:08:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670314137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F1A1CFcFf3GqMuy5IEJ2+hVWZS9vmxhjGVY53C6/Tbc=;
 b=TyQUaq+SkWZv4vnPfoiHUZS+1OG+Vw7LYmyAfSPMgJtA3BM+NNonKppxh8T7QL0/rcaQYq
 FJ78QMKkJr/uoVwaC1Z0k2mBaSb/bB2GQIh3ohfVU8P6E1JvxDopcK8SDcaVfWeDFJOZPp
 RqUKjZDMObiMiZ98OaQ5Vzlmz5qTnV4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-225-0s4VrvmoOTWoOeuIgtNMSg-1; Tue, 06 Dec 2022 03:08:55 -0500
X-MC-Unique: 0s4VrvmoOTWoOeuIgtNMSg-1
Received: by mail-wm1-f72.google.com with SMTP id
 p14-20020a05600c204e00b003cf4cce4da5so5355069wmg.0
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 00:08:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F1A1CFcFf3GqMuy5IEJ2+hVWZS9vmxhjGVY53C6/Tbc=;
 b=CL7ei/TZIOHA5VXYhmuSr8reBKcZk3gvql9M0mqT+J0YdfVa/mM5xAh3R6wlQ9DUCx
 rru+ek2TFa2jh6z4X5PBoLr+S9KpgYtMKQH7lMi125bNBx7jREZ6f1F6ohmU+pP/OPl7
 z+yiytrqmJo2Ep0v3mse+TKkjKbjg/C9OfYxUkF6yNhoSAEehsE4leD05D4f52aec3gJ
 2NP+jTZGua2iQGh5VHIwzZVWE37CP/ae95chLLeQHFs5xFrcK7Bv6tJFZMKG1EwEGnnB
 g9QDdfR/v6Kh9MPXefeP29TpzEwjafkpsuCKRNZPt2rQ/yqVNfCGF0ky1psY8qe6WsPg
 2ykg==
X-Gm-Message-State: ANoB5pmfnl4M0J5XMU9DYW/9f5MO1M6vXFtC8OPTM5GbCRYM4TVh8y2m
 Ae0/tQAPBrMmeK+M0G2Yhya5kgIUeEhkiJdkbJvsEh8jNgteobRMuoLVbxk658nBIel7Z4sC+rM
 hrOvsM2YRVpbGZ18=
X-Received: by 2002:a5d:53cd:0:b0:242:47b9:7ad6 with SMTP id
 a13-20020a5d53cd000000b0024247b97ad6mr9486358wrw.93.1670314134807; 
 Tue, 06 Dec 2022 00:08:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4rxUAcJC6zy8+tYysoaxAzgxOCA7nYej19DZzekT3Dgb7XhW7xOXvB8TS4PF1YsSVE0d3SLg==
X-Received: by 2002:a5d:53cd:0:b0:242:47b9:7ad6 with SMTP id
 a13-20020a5d53cd000000b0024247b97ad6mr9486347wrw.93.1670314134584; 
 Tue, 06 Dec 2022 00:08:54 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-155.web.vodafone.de.
 [109.43.178.155]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c4f1600b003cf54b77bfesm26632319wmq.28.2022.12.06.00.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 00:08:53 -0800 (PST)
Message-ID: <7636424d-6c57-af1d-42cf-d4052428c6e2@redhat.com>
Date: Tue, 6 Dec 2022 09:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Eldon Stegall <eldon-qemu@eldondev.com>,
 Simon Sharwood <simon@jargonmaster.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
References: <CAHW_L2i3WBULFk+Gh2cxqwB-mrvB1iE3NOgFdozaN9hDVuFK1Q@mail.gmail.com>
 <Y45BEF1B1Pbx9yZ2@invalid>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Sad to see the advent calendar go
In-Reply-To: <Y45BEF1B1Pbx9yZ2@invalid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

  Hi Eldon!

On 05/12/2022 20.07, Eldon Stegall wrote:
> Hi Simon,
> 
> Thanks for your interest in the calendar! I am not a regular QEMU
> contributor, but I am a longtime user, and ran the calendar in 2020. I
> also put out a submission request for the calendar this past year, but
> there wasn't much response.

Drat, I completely missed your message in October, otherwise I would have 
replied :-/
I think I have ideas left for at least two images.

> As far as future calendars go, the effort to construct a new calendar
> with novel, thematic content is substantial. Some of the difficulty lies
> in the technical element, but a lot of it lies in the synthesis and
> ideation.
> 
> In 2020 I had a number of community submissions, and good pointers,
> but I also put in substantial effort, which I was capable of as a result
> of a holiday sabbatical. This year was a little different.
> 
> I'm not sure if others in the community have the same perspective, but
> that is my perspective, and I would be committed to the 2023 calendar if
> folks were interested. I assembled some resources for the 2022 calendar,
> but I think with a little more upfront planning, and some directed
> request, I can coordinate a much better outcome for 2023.

I agree - the main problem is to come up with a list of 24 good ideas and 
with the preparation of the images - which takes a lot of time.

Since I didn't see your message in October, I thought there would not be 
interest in another edition. And given the fact that we don't get the server 
traffic for free anymore and the server needs a major re-installation soon 
anyway (its OS will be EOL in 2024), I thought it would be best to finally 
decommission the advent calendar. But if you plan another edition for 2023 
and want to take care of the server issues, please count me in for at least 
two images next year :-)

  Thomas


