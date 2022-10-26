Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC5060E0D9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 14:38:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onfbc-0007dh-96; Wed, 26 Oct 2022 08:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1onfbX-00079Y-AV
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 08:33:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1onfbS-0004pB-PN
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 08:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666787629;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T4AZwKift2SGQt1FYp6BuqZKbKCO2pdx6ZAU+iAllVk=;
 b=QcpNX1ZSeDW3OObO+n4JsPqa6r0A3F1NQ8rRN/H9I1Rkf3aocZob64QZ7i2iTxTsJFUBEh
 2z3cwszzN+z5u2ZWBoPGFxpW3NXpyfiuv422Nbx5cFJ5ikw866qYmVH3s/ormc+tWhClSc
 pJ3yfzPC2k/cVUmoLEfLjKWMgrY7jPQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-DYWLa1ZEP2iG-vhVx6xXhw-1; Wed, 26 Oct 2022 08:33:47 -0400
X-MC-Unique: DYWLa1ZEP2iG-vhVx6xXhw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B231F1C08965
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 12:33:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DDF5C15BB1;
 Wed, 26 Oct 2022 12:33:46 +0000 (UTC)
Date: Wed, 26 Oct 2022 13:33:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] seccomp: Get actual errno value from failed seccomp
 functions
Message-ID: <Y1kpKGP+a2toN/4w@redhat.com>
References: <80c86614e3b21dda074b81fe9c3866fdbbb7420e.1666769319.git.mprivozn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80c86614e3b21dda074b81fe9c3866fdbbb7420e.1666769319.git.mprivozn@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Oct 26, 2022 at 09:30:24AM +0200, Michal Privoznik wrote:
> Upon failure, a libseccomp API returns actual errno value very
> rarely. Fortunately, after its commit 34bf78ab (contained in
> 2.5.0 release), the SCMP_FLTATR_API_SYSRAWRC attribute can be set
> which makes subsequent APIs return true errno on failure.
> 
> This is especially critical when seccomp_load() fails, because
> generic -ECANCELED says nothing.
> 
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> 
> v2 of:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg04509.html
> 
> diff to v1:
> - added comment when setting SYSRAWRC attribute per Philippe's
>   suggestion
> 
>  meson.build            |  9 +++++++++
>  softmmu/qemu-seccomp.c | 13 +++++++++++++
>  2 files changed, 22 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


