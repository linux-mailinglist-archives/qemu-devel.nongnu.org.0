Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18414ED683
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:07:50 +0200 (CEST)
Received: from localhost ([::1]:43348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqmT-00049e-M2
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:07:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nZqfn-0007UR-LM
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:00:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nZqfl-0004Bq-9b
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:00:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648717252;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BuqkkGgGXCxzRL6yOlBr2HGJjk2midZHSoM5E+pGFME=;
 b=awxtjN0e6jNAKlQNcrF9yCyMvQdu9LNyyZ2eVZm+BxB6bXAywsGMsL+HhPEgm7qj6o3Moe
 Xf7qm0ojnJCotgT6MIc/pFG2zekCps59IDdsSE9+vA9OInCJ+3rhF2J6CN77yc2j5waUh7
 ZqfriAQydMjGQr1DtwC7AWMzGsJROR0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-o3KpGjjbMPSV2wJwlq0-0g-1; Thu, 31 Mar 2022 05:00:48 -0400
X-MC-Unique: o3KpGjjbMPSV2wJwlq0-0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6020E3C11C81;
 Thu, 31 Mar 2022 09:00:47 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B71D1400C2B;
 Thu, 31 Mar 2022 09:00:44 +0000 (UTC)
Date: Thu, 31 Mar 2022 10:00:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH v3 17/36] pflash_cfi01/tdx: Introduce ram_mode of
 pflash for TDVF
Message-ID: <YkVtuRNherKV1kJC@redhat.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-18-xiaoyao.li@intel.com>
 <f418548e-c24c-1bc3-4e16-d7a775298a18@gmail.com>
 <7a8233e4-0cae-b05a-7931-695a7ee87fc9@intel.com>
 <YjmWhMVx80/BFY8z@redhat.com>
 <1d5b0192-75ef-49ad-dc47-cfc0c3c63455@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d5b0192-75ef-49ad-dc47-cfc0c3c63455@intel.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, seanjc@google.com, erdemaktas@google.com,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 04:51:27PM +0800, Xiaoyao Li wrote:
> On 3/22/2022 5:27 PM, Daniel P. Berrangé wrote:
> ...
> > IMHO the AmdSev build for OVMF gets this right by entirely disabling
> > the split OVMF_CODE.fd vs OVMF_VARS.fd, and just having a single
> > OVMF.fd file that is exposed read-only to the guest.
> > 
> > This is further represented in $QEMU.git/docs/interop/firmware.json
> > by marking the firmware as 'stateless', which apps like libvirt will
> > use to figure out what QEMU command line to pick.
> 
> Hi Daniel,
> 
> I don't play with AMD SEV and I'm not sure if AMD SEV requires only single
> OVMF.fd. But IIUC, from edk2
> 
> commit 437eb3f7a8db ("OvmfPkg/QemuFlashFvbServicesRuntimeDxe: Bypass flash
> detection with SEV-ES")
> 
> , AMD SEV(-ES) does support NVRAM via proactive VMGEXIT MMIO
> QemuFlashWrite(). If so, AMD SEV seems to be able to support split OVMF,
> right?

Note that while the traditional OvmfPkg build can be used with
SEV/SEV-ES, this is not viable for measured boot, as it uses
the NVRAM whose content is not measured.

I was specifically referring to the OvmfPkg/AmdSev build which
doesn't use seprate NVRAM, and has no variables persistence.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


