Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A9C470150
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 14:11:10 +0100 (CET)
Received: from localhost ([::1]:39808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvfg3-0007KJ-Eq
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 08:11:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mvfap-0005II-GH
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 08:05:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mvfal-0007Cu-Hc
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 08:05:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639141523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ivv46FTFurmQY6l99ByKetWVos1wM6aXi8QILreAtmU=;
 b=gihFHY8GhdNp+DtCX3gZMjPv6/p8kLZgRl/+a69xxpCw8xzAOLo4vZFUutaDMbOeINVzuV
 DHoJuEzzpGgPAjmYpcqUekbBRL3IhBE0ssXO72+i/XgfnqIf4FgwSpjsJnKtpkfbzhsmVk
 ecOjoZ2zMhDAiqoukTvW4+C9QQnKmI8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-9JNBhLwnOOKFGl-klyp9wA-1; Fri, 10 Dec 2021 08:05:20 -0500
X-MC-Unique: 9JNBhLwnOOKFGl-klyp9wA-1
Received: by mail-wm1-f69.google.com with SMTP id
 g11-20020a1c200b000000b003320d092d08so4864541wmg.9
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 05:05:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ivv46FTFurmQY6l99ByKetWVos1wM6aXi8QILreAtmU=;
 b=gPjVxZtPLR/F8ef4OCxmyZAk4FQnO4jeVbUCTWGlDlawgmfSipEsKeY5boBfqMdQe3
 NT5O4iBph3STj7s//HXNHoULBNk+7EYOyYbgqa0Op9/AveTKvfHWNKMl/11dDsoS9SRg
 6rv+aToG4gh/f79XY8fGEP9j8yKKhp0FbL9eqdmuulPCJ+u5ljyGbxXIkLZtzsGqXy55
 D1Q81XsylI24WJNtK9yTL9WRFvjFnSVTkVk6adCD8CHIi2kCEJijSuRjuTfA9YIWzw4k
 I5oFwkBLHl+uvQuYZ4jqGq0aTTBhQkltVEb7uVeq7IEfVv6cmRdIlkVlHIP7m2YUuvHi
 Do0Q==
X-Gm-Message-State: AOAM532uEvSjTyJBi2N2cY9hIjg/ov6qrTDJyA0fA7LMrFqAIIPkPj9/
 xcJP9c4UKAGrJdn1ta9eNYcdfdey2W8HJHQOh8EMH9H7pV6Bqv/DLSou85o4ljajrxJeB7pNhpt
 m5gzratdXl0ITgDg=
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr16820320wmc.62.1639141519094; 
 Fri, 10 Dec 2021 05:05:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrJalcaiB+iMM7Tu2hO2d+2lFSj79NIyBLFoh+6NMfJpxmedQX2DZsWNGkq6Oq01cM6cUn4A==
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr16820231wmc.62.1639141518366; 
 Fri, 10 Dec 2021 05:05:18 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o63sm3066594wme.2.2021.12.10.05.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 05:05:17 -0800 (PST)
Message-ID: <9e55f8f5-1588-367d-3681-54c77d77700f@redhat.com>
Date: Fri, 10 Dec 2021 14:05:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] Move the libssh setup from configure to meson.build
To: "Richard W.M. Jones" <rjones@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20211209144801.148388-1-thuth@redhat.com>
 <20211209145501.GK1127@redhat.com>
 <b59169e2-409a-75e0-339c-4021499d7131@redhat.com>
 <20211209152230.GL1127@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211209152230.GL1127@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.317, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/21 16:22, Richard W.M. Jones wrote:
> On Thu, Dec 09, 2021 at 04:08:24PM +0100, Thomas Huth wrote:
>> On 09/12/2021 15.55, Richard W.M. Jones wrote:
>>> On Thu, Dec 09, 2021 at 03:48:01PM +0100, Thomas Huth wrote:
>>>> It's easier to do this in meson.build now.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>  v2: Added the missing "config_host_data.set('CONFIG_LIBSSH', libssh.found())"
>>>>
>>>>  configure                     | 27 ---------------------------
>>>>  meson.build                   | 13 +++++++++----
>>>>  meson_options.txt             |  2 ++
>>>>  scripts/meson-buildoptions.sh |  3 +++
>>>>  4 files changed, 14 insertions(+), 31 deletions(-)

>>> I should say that my interest in the ssh driver in qemu is not that
>>> much these days.  I've been telling people to use nbdkit-ssh-plugin
>>> instead.  It's more featureful and running it in a separate process is
>>> probably safer too.
>>
>> Then it's maybe time to deprecate the ssh driver in QEMU?
> 
> Weeeellllll ...  I didn't necessarily want to say that.  Others may be
> using it, and deprecating working software causes trouble for some.
> But I'll let others have their say on this.

The deprecation process is slow, users have 8 months to notice it,
and we might discover contributors willing to maintain it. IOW more
PROs than CONs IMHO.

> I will mention that RHEL 9.1 will replace qemu's curl and ssh drivers
> with nbdkit-curl-plugin and nbdkit-ssh-plugin.  For RHEL users this
> should happen transparently.  Libvirt will substitute an external
> nbdkit process when it sees the appropriate <disk> in the XML (all
> RHEL users are required to use libvirt instead of qemu directly).  Of
> course qemu doesn't need to care about what RHEL does, this is just
> for your information.
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2016527
> 
> Rich.
> 


