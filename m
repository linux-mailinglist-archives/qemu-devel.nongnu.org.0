Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127B35E5FF8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 12:32:44 +0200 (CEST)
Received: from localhost ([::1]:54802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJVa-0004Vp-Cs
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 06:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obIYf-0006UE-9R
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:31:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obIYb-00005i-6t
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663839090;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4YvTboMpeqRgORQVns/62HzVvw2BndKmIssR2jT6Li4=;
 b=eFGUwF3PCYj2sw5U0XVMkHWsLHEo1hcm1aSLmM0zyqPMOrsWFdVHo3EykFnRmp5gz0GP/4
 G9kXxiqECJLA1BAW9jChUYsEDStd74Po+ll+fMQbRCStlthfJlaxb+qb3FFdCTzz2B+cBT
 5QOwS9s+S3xYXOw1BcjJcS4ocKXarK0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-er8O860IOR-qBZHmK1ALbg-1; Thu, 22 Sep 2022 05:31:27 -0400
X-MC-Unique: er8O860IOR-qBZHmK1ALbg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2976386C043;
 Thu, 22 Sep 2022 09:31:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76E1B2166B4A;
 Thu, 22 Sep 2022 09:31:24 +0000 (UTC)
Date: Thu, 22 Sep 2022 10:31:21 +0100
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
Message-ID: <YywraWlVnJoy6ypN@redhat.com>
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de>
 <877d23ekj0.fsf@pond.sub.org>
 <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
 <87y1ucdirx.fsf@pond.sub.org>
 <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
 <878rmc54cw.fsf@pond.sub.org> <Yywcs7CpKDxahOSM@redhat.com>
 <5e6d958d-3b69-1472-b1b8-3a63186f0c5b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e6d958d-3b69-1472-b1b8-3a63186f0c5b@suse.de>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Thu, Sep 22, 2022 at 11:20:07AM +0200, Claudio Fontana wrote:
> On 9/22/22 10:28, Daniel P. Berrangé wrote:
> > 
> >> Another interface that does: return -1 for error, 0 for module not found
> >> (no error), and 1 for loaded.
> > 
> > IMHO this pattern is generally easier to understand when looking at
> > the callers, as the fatal error scenario is always clear.
> > 
> > That said I would suggest neither approach as the public facing
> > API. Rather stop trying to overload 3 states onto an error reporting
> > pattern that inherantly wants to be 2 states. Instead just have
> > distinct methods
> > 
> >   bool module_load_one(const char *prefix, const char *name, Error *errp)
> >   bool module_try_load_one(const char *prefix, const char *name, Error *errp)
> 
> 
> Here we are murking again the normal behavior and the error path.
> 
> What is the meaning of try? It's not as though we would error out inside the function module_load_one,
> it's the _caller_ that needs to decide how to treat a return value of found/not found, and the exception (Error).

I suggested "try" as in the  g_malloc vs g_try_malloc API naming pattern,
where the latter ignores the OOM error condition.

So in this case 'try' means try to load the module, but don't fail if
the module is missing on disk.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


