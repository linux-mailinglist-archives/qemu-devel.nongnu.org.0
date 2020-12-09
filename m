Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD132D44C4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:50:23 +0100 (CET)
Received: from localhost ([::1]:44856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0nO-0005Xb-5v
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:50:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kn0jV-0003zn-JB
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:46:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kn0jT-0001WG-1n
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607525177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zik1UF0IFABGIRW+ELlDMYECqkHbesbuS9txUY+2mNA=;
 b=YgbbgFsD8UwedXmzapxP/75QUNMI1tHGqnkedv63etebAnJq5rIRwyEH/D2PmWDiMFct9R
 uMydPVCHguXxNpNcA8D5/U4BouvRDIZZVg8u9NPgmcT/F3IfwkPvAM5NY+F4+MX7t5ei6l
 ey9MqBLmpPDXduDk5qlhroZGAZt++To=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-rf3TqqfzMhuoevaqxkyYCg-1; Wed, 09 Dec 2020 09:46:11 -0500
X-MC-Unique: rf3TqqfzMhuoevaqxkyYCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE2501966320;
 Wed,  9 Dec 2020 14:46:08 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2FA060BF3;
 Wed,  9 Dec 2020 14:46:04 +0000 (UTC)
Date: Wed, 9 Dec 2020 09:46:03 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC v9 18/32] cpu: Move synchronize_from_tb() to tcg_ops
Message-ID: <20201209144603.GO1289986@habkost.net>
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-19-cfontana@suse.de>
 <87im9bdzab.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87im9bdzab.fsf@linaro.org>
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 09, 2020 at 10:50:29AM +0000, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
> > From: Eduardo Habkost <ehabkost@redhat.com>
> >
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > [claudio: wrapped in CONFIG_TCG]
> > Signed-off-by: Claudio Fontana <cfontana@suse.de>
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > ---
[...]
> > @@ -20,6 +17,17 @@ typedef struct TcgCpuOperations {
> >       * Called when the first CPU is realized.
> >       */
> >      void (*initialize)(void);
> > +    /**
> > +     * @synchronize_from_tb: Synchronize state from a TCG #TranslationBlock
> > +     *
> > +     * This is called when we abandon execution of a TB before
> > +     * starting it, and must set all parts of the CPU state which
> > +     * the previous TB in the chain may not have updated. This
> > +     * will need to do more. If this hook is not implemented then
> > +     * the default is to call
> > +     * @set_pc(tb->pc).
> > +     */
> 
> We could clean-up the comment here to better fit the javadoc style API
> documentation format, i.e.:
> 
>     /**
>      * synchronize_from_tb: Synchronize current TCG execution state
>      * @cpu: current cpu
>      * @tb: about to be executed #TranslationBlock
>      *
>      * This is called when we abandon execution of a TB before
>      * starting it, and must set all parts of the CPU state which
>      * the previous TB in the chain may not have updated. This
>      * will need to do more. If this hook is not implemented then
>      * the default is to call @set_pc(tb->pc).
>      */

Would this work with kernel-doc?  This will be parsed as a
portion of the documentation of struct TcgCpuOperations, so I was
not expecting kernel-doc to treat the "@cpu: ..." and "@tb: ..."
lines as valid.

-- 
Eduardo


