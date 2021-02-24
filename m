Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAC632472D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 23:55:33 +0100 (CET)
Received: from localhost ([::1]:41734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF348-00030m-QL
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 17:55:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lF32I-0002Ck-DH
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:53:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lF32E-0000Qz-44
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:53:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614207213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWtFQ+v2znOPw4h3JmBisrmB2fhK36zsmHodIPTR4jw=;
 b=KmMC3C4X8omfZTi6xV99uTRTdXty0/V7G3Zy2ZvSgEz6EEbdW4lsjFyeb+hSyf1fdRZGdk
 GR2+RG9/JWYEEv5ZCqO7icQMM2R4/1KX69HuUlsxSXXaxitlF8Q5OKJL66D/MK4oqvdO5r
 Qihibz+Rh+wPhfPjw9ZZrVLxYfEHsJk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-0imOFckOOdGTBc1ZsL-Y-A-1; Wed, 24 Feb 2021 17:53:29 -0500
X-MC-Unique: 0imOFckOOdGTBc1ZsL-Y-A-1
Received: by mail-wm1-f71.google.com with SMTP id b62so1142116wmc.5
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 14:53:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XWtFQ+v2znOPw4h3JmBisrmB2fhK36zsmHodIPTR4jw=;
 b=BLSma2mSSVEPRDDof/iVOx4XqBKuhfdVH9uc2rAGolUR8HOhkfMUsds2QgzSUWejrT
 BryuuM/6ypDH7zJau0cB/3lckiOln+Y/cUkeeGm8DXUlkl/rKNOzPqWK+w6E6CPWChvA
 mmdRm9h4c1s9vRDL9oKRddL8wBi0U0Fnau2DeCNI96tWP9ofS5FdaWpaBNU/mkAreQoO
 hTAo14TctdQovNjKWfD0JBSItOdhn7n3bvVZRV+wg/OwNbackprjzMn5lhN4lvldE62B
 rD7DQUj6YWtghcuOtNHp1qN3cr5F+jp59CnkXesWw+1FPKrxPvUXYA8BHHBnFVOFBrj7
 TyCA==
X-Gm-Message-State: AOAM530IbehpE7x43k+SPfFDRQmDcq9iaV2nh1npkj9nt8TKDCI9G7EN
 ZVheU1v+WnpA7MjvJ+2k8wz/0BM03QkxwhS0uCdX4sROOI8Lh1goAJHMXEAxQXUjOUSBDe883jx
 TZw4ZdkvQj1z9cRcspjDlq/KPD71+FOqk+AhyHiAaKEBl3MTk+U0RGU8suA0Ncx5W
X-Received: by 2002:a5d:5710:: with SMTP id a16mr261708wrv.275.1614207208531; 
 Wed, 24 Feb 2021 14:53:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNIjYzJwtX0vwWZoDXwF0rXHGcrZIdZS/7mgD7FWfH7mFBh9V/eldZLH7rLpnhCZtlb1q9Gw==
X-Received: by 2002:a5d:5710:: with SMTP id a16mr261690wrv.275.1614207208336; 
 Wed, 24 Feb 2021 14:53:28 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c3sm5639993wrr.29.2021.02.24.14.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 14:53:27 -0800 (PST)
Subject: Re: [PATCH v22 06/17] meson: add target_user_arch
To: Eric Blake <eblake@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-7-cfontana@suse.de>
 <ab323577-c68e-c215-655f-1b45d2e9b112@redhat.com>
 <37da6126-a6eb-a12e-2944-9ac4a232390c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f8d003fc-5f1d-3280-4466-331cbb8cfafb@redhat.com>
Date: Wed, 24 Feb 2021 23:53:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <37da6126-a6eb-a12e-2944-9ac4a232390c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 11:35 PM, Eric Blake wrote:
> On 2/24/21 3:21 PM, Philippe Mathieu-Daudé wrote:
>> On 2/24/21 2:34 PM, Claudio Fontana wrote:
>>> the lack of target_user_arch makes it hard to fully leverage the
>>> build system in order to separate user code from sysemu code.
>>>
>>> Provide it, so that we can avoid the proliferation of #ifdef
>>> in target code.
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>>
>>> [claudio: added changes for new target hexagon]
>>
>> Again, this line goes ...
>>
>>> ---
>>
>> ... here. Else it is not stripped by git-am and ends
>> burried in the repository (see commit 940e43aa30e).
> 
> If you are modifying a patch originally written by someone else (that
> is, their S-o-b appears first, but your edits mean you also add S-o-b),
> it is courteous to include your modifications in the commit log in this
> manner.  (For an example, see commit 2c4c556e06)
> 
> You're right that it can look fishy if your changlog appears on your own
> commit (if you rebased things with no one else touching the patch in
> between, just update the commit message as part of that rebase; the
> changelog goes after the --- for review in that case).  But it's not
> completely wrong: you'll see me doing it when wearing my maintainer hat
> and preparing a pull request, and modifying my own patch different from
> how it was posted on the mailing list while wearing my developr hat
> prior to the pull request (see commit c930831446 for an example)

In that case that makes sense indeed (although in Claudio's case I
find it more confusing).

Regards,

Phil.


