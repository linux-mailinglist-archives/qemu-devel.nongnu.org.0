Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CAD2DC785
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 21:11:04 +0100 (CET)
Received: from localhost ([::1]:53162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpd8X-0006kw-IA
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 15:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpd70-0005qH-7V
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 15:09:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpd6x-000703-Ae
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 15:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608149361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gj14tO7ADOcpKQ7c2PlxB5GtKjBLOktc991PLPtOR0A=;
 b=WOoU8yZQdXW8NvVMraYn6NEO2m8CqmG7vggSFF9agQdgkP8u42lK3FXs5N6xyB6ItjoNky
 tyQ6HPq/7HVOHHDiiZZLhc0LfrBgmyWyZg2JXfjFEuBmD0o3PVvK67Xaae+QAJ+vX+GpIM
 uoAn0GOtTxy8uW7xusDtgXDMdfiNQ2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-EuSoxdObNx6KItYzrp5bBw-1; Wed, 16 Dec 2020 15:09:19 -0500
X-MC-Unique: EuSoxdObNx6KItYzrp5bBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82338804002;
 Wed, 16 Dec 2020 20:09:17 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCC3760C15;
 Wed, 16 Dec 2020 20:09:10 +0000 (UTC)
Date: Wed, 16 Dec 2020 15:09:09 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v12 16/23] cpu: Move synchronize_from_tb() to tcg_ops
Message-ID: <20201216200909.GI3140057@habkost.net>
References: <20201212155530.23098-1-cfontana@suse.de>
 <20201212155530.23098-17-cfontana@suse.de>
 <20201214191029.GO1289986@habkost.net>
 <e72e2d6b-ef99-5590-fe18-9cb6d4092e23@redhat.com>
 <20201214222354.GT1289986@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20201214222354.GT1289986@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 05:24:00PM -0500, Eduardo Habkost wrote:
> On Mon, Dec 14, 2020 at 10:56:13PM +0100, Philippe Mathieu-Daudé wrote:
> > Hi Claudio, Eduardo.
> > 
> > On 12/14/20 8:10 PM, Eduardo Habkost wrote:
> > > On Sat, Dec 12, 2020 at 04:55:23PM +0100, Claudio Fontana wrote:
> > >> From: Eduardo Habkost <ehabkost@redhat.com>
> > >>
> > >> since tcg_cpu_ops.h is only included in cpu.h,
> > >> and as a standalone header it is not really useful,
> > >> as tcg_cpu_ops.h starts requiring cpu.h defines,
> > >> enums, etc, as well as (later on in the series),
> > >> additional definitions coming from memattr.h.
> > >>
> > >> Therefore rename it to tcg_cpu_ops.h.inc, to warn
> > >> any potential user that this file is not a standalone
> > >> header, but rather a partition of cpu.h that is
> > >> included conditionally if CONFIG_TCG is true.
> > > 
> > > What's the benefit of moving definitions to a separate file, if
> > > the new file is not a standalone header?
> > 
> > Claudio, I haven't been following every respin. If you did that
> > change just to please me then the circular dependency remarked by
> > Richard, then if it simplify the series I'm OK if you have to
> > remove the includes.
> > 
> > Eduardo, if you are happy with patches 1-8 (x86 specific), maybe
> > you can queue them already. The rest is more TCG generic and
> > will likely go via Richard/Paolo trees IMO.
> 
> Patches 01-06 are queued.  Patches 07 and 08 need review.

Patches 07-12 are now queued too.

-- 
Eduardo


