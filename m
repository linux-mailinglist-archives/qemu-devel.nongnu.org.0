Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D895AB6FD
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 18:58:10 +0200 (CEST)
Received: from localhost ([::1]:50500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU9zd-0005MT-E7
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 12:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oU9ue-0004yB-QE
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oU9uc-0003cP-IM
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662137577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7FRsXiPQLrdmyMGr3Bh7kFUvHRKBZGqby8pLojjXECg=;
 b=CZudOIYaQuRiczQhbJLCBXT7Txg3tknind+xLuYnWoMfSvB1cDgF/dXDBKtygMQBZOzgvz
 CIA/bNIVUIIfBEa+vESpsiIdILLyv8+HVNjitRwH6W6/vQBTa73CPpcDhus42LW/a/ZD2p
 fvixOjmgGgC5UGqPUy3cvzCfjc3R7y4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-kGOD_9VhMguLAH2ARmJYgw-1; Fri, 02 Sep 2022 12:52:53 -0400
X-MC-Unique: kGOD_9VhMguLAH2ARmJYgw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A888294EDFB;
 Fri,  2 Sep 2022 16:52:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE9AD18ECC;
 Fri,  2 Sep 2022 16:52:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ABDF7180039D; Fri,  2 Sep 2022 18:52:51 +0200 (CEST)
Date: Fri, 2 Sep 2022 18:52:51 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 15/40] i386/tdx: Add property sept-ve-disable for
 tdx-guest object
Message-ID: <20220902165251.g2xfstp4u3sqnloz@sirius.home.kraxel.org>
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
 <20220802074750.2581308-16-xiaoyao.li@intel.com>
 <20220825113636.qlqmflxcxemh2lmf@sirius.home.kraxel.org>
 <389a2212-56b8-938b-22e5-24ae2bc73235@intel.com>
 <20220826055711.vbw2oovti2qevzzx@sirius.home.kraxel.org>
 <a700a0c6-7f25-dc45-4c49-f61709808f29@intel.com>
 <YxFv6RglTOY3Pevj@google.com>
 <20220902054621.yyffxn2vnm74r2b3@sirius.home.kraxel.org>
 <YxIgq9flJehbEngQ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxIgq9flJehbEngQ@google.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 02, 2022 at 03:26:35PM +0000, Sean Christopherson wrote:
> On Fri, Sep 02, 2022, Gerd Hoffmann wrote:
> > 
> > Hmm, ok, but shouldn't the SEPT_VE bit *really* controlled by the guest then?
> > 
> > Having a hypervisor-controlled config bit to protect against a malicious
> > hypervisor looks pointless to me ...
> 
> IIRC, all (most?) of the attributes are included in the attestation report, so a
> guest/customer can refuse to provision secrets to the guest if the hypervisor is
> misbehaving.

Good.  I think we sorted all issues then.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


