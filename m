Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F139E5365EC
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:23:46 +0200 (CEST)
Received: from localhost ([::1]:50340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuckc-0002Ep-2w
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nucLO-0001ys-27
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:57:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nucLM-0006Hm-3Q
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653667059;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dKNOtKrkSfGMhCWnY361y9cMiCDlFFvU/VNimP61NOA=;
 b=DC6XlMTEODmkv/3ZoXMTlzwUFljPiWrh/xCCRUY/noOWxHTWabo5hOOOMR0aHd/bJxWoV5
 rhlH+ldkYq0aHLzlorEOThXNGsd1tn3ntKVEYMedNMXEtqJlzwZScjpEUYjBXChqJrAMpk
 4Cfufo/Tyoj9TUmnfTfo74ycee9bg3k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-hb2u5RZdPAmYciL-h7CVGQ-1; Fri, 27 May 2022 11:57:36 -0400
X-MC-Unique: hb2u5RZdPAmYciL-h7CVGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3AD780088A;
 Fri, 27 May 2022 15:57:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45F681410DD5;
 Fri, 27 May 2022 15:57:34 +0000 (UTC)
Date: Fri, 27 May 2022 16:57:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH  v1 32/33] gitlab: don't run CI jobs in forks by default
Message-ID: <YpD06hSyMJapTtqJ@redhat.com>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
 <20220527153603.887929-33-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220527153603.887929-33-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, May 27, 2022 at 04:36:02PM +0100, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> To preserve CI shared runner credits we don't want to run
> pipelines on every push.
> 
> This sets up the config so that pipelines are never created
> for contributors by default. To override this the QEMU_CI
> variable can be set to a non-zero value. If set to 1, the
> pipeline will be created but all jobs will remain manually
> started. The contributor can selectively run jobs that they
> care about. If set to 2, the pipeline will be created and
> all jobs will immediately start.
> 
> This behavior can be controlled using push variables
> 
>   git push -o ci.variable=QEMU_CI=1
> 
> To make this more convenient define an alias
> 
>    git config --local alias.push-ci "push -o ci.variable=QEMU_CI=1"
>    git config --local alias.push-ci-now "push -o ci.variable=QEMU_CI=2"
> 
> Which lets you run
> 
>   git push-ci
> 
> to create the pipeline, or
> 
>   git push-ci-now
> 
> to create and run the pipeline
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20220526110705.59952-6-berrange@redhat.com>
> [AJB: fix typo, replicate alias tips in ci.rst]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Looks good to me.



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


