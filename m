Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3BF69AD36
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 14:54:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT19z-0002vQ-Ba; Fri, 17 Feb 2023 08:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pT19x-0002v4-P4
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 08:52:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pT19w-0004K7-2U
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 08:52:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641939;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yEgen9jCDG/VPnHCI9H7lnFvUNj3HP5IJXD11flmpyA=;
 b=YsrgvWqjfwbhlAmeyRzw6JlRkipldtgUqqnZfNhZio9aL8BCalfGr6bbvJJPIioOw7drBE
 GjWWX76JW1zAvjpqFWlY9n2HsoSY2pj8dTMWqthNQoZjx3WmRC5+g5iw+0gBAY7NS8gSj+
 puXLyDnV4PHgg0d6cz6fzirNqL4uo9M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-uoMNdMEGMb-NVYHmP8fj5A-1; Fri, 17 Feb 2023 08:52:16 -0500
X-MC-Unique: uoMNdMEGMb-NVYHmP8fj5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F0FD1C0A59E;
 Fri, 17 Feb 2023 13:52:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 130731121314;
 Fri, 17 Feb 2023 13:52:10 +0000 (UTC)
Date: Fri, 17 Feb 2023 13:52:08 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: Proposed way forward Re: [PATCH v2 0/7] Python: Drop support for
 Python 3.6
Message-ID: <Y++GiHg0+BMdMZOQ@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <Y+9m6g0MAEfFNUYC@redhat.com>
 <ffe372fc-2842-bb64-6c0c-42dcd68da775@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffe372fc-2842-bb64-6c0c-42dcd68da775@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Feb 17, 2023 at 02:46:53PM +0100, Thomas Huth wrote:
> On 17/02/2023 12.37, Daniel P. Berrangé wrote:
> ...
> > The long life enterprise distros are the pain point in unlocking the
> > new of python features. So the proposal is that, at a minimum, we
> > augment the current policy with words to the effect that:
> > 
> >    * For long life cycle distributions, QEMU will follow normal
> >      policy for platform level dependancies / native code. For
> >      Python modules, QEMU may choose to require a newer versions
> >      than are available from the distribution package manager.
> 
> Sounds reasonable to me. But I think we still should also add a sentence
> where we limit the total amount of time that we promise to support a
> long-term distro. Otherwise we'll also get problems with other way too
> backlevel native code dependencies at one point in time.

Oh sure, having something time related mention makes sense.

> I just sent a patch for discussion, shortly before I noticed your mail here.
> Feel free to grab the ideas from there into your patch (if you're planning
> to send one), or let me know if I should try to include the Python-related
> sentences in mine.

I wasn't planning to imminently send a change. Especially now that
both yourself an Paolo have proposed similar competing additions,
lets just iterate on one of those 2 proposals.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


