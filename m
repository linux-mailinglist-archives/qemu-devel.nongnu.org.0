Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC5735AB1B
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 07:45:08 +0200 (CEST)
Received: from localhost ([::1]:49676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lV6Qd-0002kB-7Y
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 01:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lV6PN-0002Ik-Lp
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 01:43:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lV6PL-00011w-2B
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 01:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618033424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wiSvoIeG1IErOtCg/rc2EBreMOYodz+djWz5UYQqYdA=;
 b=XOfvYmvtZn5gFAWpJcaZBJHdJ+MgUliT4PXNpnoxvoiLTBINlQ+aKDpAlVMAAvYRj/4z+J
 Ls4S9zJsZcoTY+88qJrv8WSQoM45ixoqUTE3wv/7E+N/3RppMDglTVINIEjpo//yBHWbo9
 EAEgfLqYJMvcGcBfP+U7POxCKGHhkoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-w2BX1sstN9uSh6Wifsvkfg-1; Sat, 10 Apr 2021 01:43:42 -0400
X-MC-Unique: w2BX1sstN9uSh6Wifsvkfg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 119E1501F4;
 Sat, 10 Apr 2021 05:43:41 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-20.ams2.redhat.com [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12ED95D9D3;
 Sat, 10 Apr 2021 05:43:37 +0000 (UTC)
Subject: Re: Discussion: Patch series that adds disable-tcg option for ppc
 targets
To: David Gibson <david@gibson.dropbear.id.au>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
References: <CP2PR80MB44990766F1D104E630ADFDDAC7779@CP2PR80MB4499.lamprd80.prod.outlook.com>
 <YGv7ku+6XNMW1QFM@yekko.fritz.box>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d9fbd209-6bb9-982d-5bbd-580cbfa27c34@redhat.com>
Date: Sat, 10 Apr 2021 07:43:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YGv7ku+6XNMW1QFM@yekko.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/04/2021 08.11, David Gibson wrote:
> On Mon, Apr 05, 2021 at 01:32:18PM +0000, Bruno Piazera Larsen wrote:
[...]
>>      * exclude 8 files from the build (dfp_helper.c, excp_helper.c,
>>        fpu_helper.c, int_helper.c, mem_helper.c, misc_helper.c, *
>>        translate.c, timebase_helper.c);
> 
> That looks about right.

IIRC you don't only have to exclude translate.c from the build, you also 
have to separate translate_init.c.inc from it, i.e. turn 
translate_init.c.inc into a proper .c file and get rid of the #include 
"translate_init.c.inc" statement in translate.c, since many functions in the 
translate_init.c.inc file are still needed for the KVM-only builds, too. So 
maybe that's a good place to start as a first mini series.

  Thomas


