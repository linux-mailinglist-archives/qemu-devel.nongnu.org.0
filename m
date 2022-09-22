Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75425E601C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 12:43:11 +0200 (CEST)
Received: from localhost ([::1]:59192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJfi-0004SH-N2
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 06:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obJa7-00073S-39
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 06:37:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obJa4-0007Cg-AL
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 06:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663843038;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vWmp2KIjvQ07Zt18EhbBcK6a+wQHyD18ARR2FqaPmTA=;
 b=Fb3j6eMCjL33U+vY0FrS1rwGz6yqbcpr+1kSv1VEMBZJcyZy/p7kmUjEjGB3lQ7sjj9+8E
 Mc2Y83As2WDmM3wuzIr6rsRvyxeHUdxE5lrXkj+iRFdidr1xvHsAhr7nEmFekpkVvfs6nU
 aZ4eIE4bVGKZh/GiQc3owbBwVSNNfAQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-UJFvsDD4Pm6_KB0zM5Poyg-1; Thu, 22 Sep 2022 06:37:13 -0400
X-MC-Unique: UJFvsDD4Pm6_KB0zM5Poyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 346AB1C05AA7;
 Thu, 22 Sep 2022 10:37:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5890C15BA5;
 Thu, 22 Sep 2022 10:37:10 +0000 (UTC)
Date: Thu, 22 Sep 2022 11:37:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 dinechin@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one
 and module_load_qom_one
Message-ID: <Yyw61MdawM2wkfiQ@redhat.com>
References: <20220908183012.17667-3-cfontana@suse.de>
 <877d23ekj0.fsf@pond.sub.org>
 <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
 <87y1ucdirx.fsf@pond.sub.org>
 <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
 <878rmc54cw.fsf@pond.sub.org> <Yywcs7CpKDxahOSM@redhat.com>
 <5e6d958d-3b69-1472-b1b8-3a63186f0c5b@suse.de>
 <YywraWlVnJoy6ypN@redhat.com>
 <df4c09e9-addf-c643-6da0-62a6cf94b349@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df4c09e9-addf-c643-6da0-62a6cf94b349@suse.de>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 11:34:22AM +0200, Claudio Fontana wrote:
> On 9/22/22 11:31, Daniel P. Berrangé wrote:
> > On Thu, Sep 22, 2022 at 11:20:07AM +0200, Claudio Fontana wrote:
> >> On 9/22/22 10:28, Daniel P. Berrangé wrote:
> >>>
> >>>> Another interface that does: return -1 for error, 0 for module not found
> >>>> (no error), and 1 for loaded.
> >>>
> >>> IMHO this pattern is generally easier to understand when looking at
> >>> the callers, as the fatal error scenario is always clear.
> >>>
> >>> That said I would suggest neither approach as the public facing
> >>> API. Rather stop trying to overload 3 states onto an error reporting
> >>> pattern that inherantly wants to be 2 states. Instead just have
> >>> distinct methods
> >>>
> >>>   bool module_load_one(const char *prefix, const char *name, Error *errp)
> >>>   bool module_try_load_one(const char *prefix, const char *name, Error *errp)
> >>
> >>
> >> Here we are murking again the normal behavior and the error path.
> >>
> >> What is the meaning of try? It's not as though we would error out inside the function module_load_one,
> >> it's the _caller_ that needs to decide how to treat a return value of found/not found, and the exception (Error).
> > 
> > I suggested "try" as in the  g_malloc vs g_try_malloc API naming pattern,
> > where the latter ignores the OOM error condition.
> > 
> > So in this case 'try' means try to load the module, but don't fail if
> > the module is missing on disk.
> 
> I understand what you mean, but this is wrong in this case.
> 
> We _do not fail_ in module_load_one, whether an error is present
> or not, whether a module is found or not.

Looking at the callers though, AFAIK there are only two patterns
that we need. All callers should report a fatal error if the module
exists and loading it failed eg module is from mis-matched build.

Some callers also want a failure if the module doesn't exist on
disk (module_load_one can be made todo this), but most callers
are happy to carry on if the module doesn't exist (module_try_load_one
can simply return success status if it doesn't exist).

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


