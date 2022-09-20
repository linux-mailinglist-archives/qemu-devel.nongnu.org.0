Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED495BE928
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 16:36:29 +0200 (CEST)
Received: from localhost ([::1]:59688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaeMO-0004FO-JP
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 10:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oabYn-0000E2-C1
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 07:37:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oabYe-0001VR-3o
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 07:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663673815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q9Kiy75k/GjyNcX5/jFVpAejSl+0Eo6vMfAUPlGa7+Q=;
 b=YNLOgLJ3y3TbmFBmF/gdP8Xdk0KoaQW5bsjzmRvPxMazs49OX9f2kORQLMFm3TGm3lWE9I
 lBA5EHIL0pZGHZ/WuwHvh7ZZD7Ppd//XHlb1ZuorrcFGI8xputyIjC7xbSz2QUYAe/QrR6
 Wq2UIEWvNI+PUMAp8yxRupBruk+mwBY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-nyyOMpweMKOJOc5LnI28Bw-1; Tue, 20 Sep 2022 07:36:52 -0400
X-MC-Unique: nyyOMpweMKOJOc5LnI28Bw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C1DF3810D23;
 Tue, 20 Sep 2022 11:36:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF591112131E;
 Tue, 20 Sep 2022 11:36:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A0E0D21E6900; Tue, 20 Sep 2022 13:36:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alistair Francis <alistair23@gmail.com>, Bin Meng
 <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Bernhard Beschow <shentey@gmail.com>,  "qemu-devel@nongnu.org
 Developers" <qemu-devel@nongnu.org>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Magnus Damm <magnus.damm@gmail.com>,  Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>,  Bandan Das <bsd@redhat.com>,  Matthew
 Rosato <mjrosato@linux.ibm.com>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  Sergio Lopez <slp@redhat.com>,  Alexey
 Kardashevskiy <aik@ozlabs.ru>,  Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Cameron Esfahani <dirty@apple.com>,  Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>,  Jagannathan Raman
 <jag.raman@oracle.com>,  Greg Kurz <groug@kaod.org>,  Kamil Rytarowski
 <kamil@netbsd.org>,  Peter Xu <peterx@redhat.com>,  Joel Stanley
 <joel@jms.id.au>,  Alistair Francis <Alistair.Francis@wdc.com>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  haxm-team@intel.com,  Roman Bolshakov
 <r.bolshakov@yadro.com>,  Markus Armbruster <armbru@redhat.com>,  Eric
 Auger <eric.auger@redhat.com>,  David Gibson
 <david@gibson.dropbear.id.au>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,  =?utf-8?Q?C=C3=A9dri?=
 =?utf-8?Q?c?= Le Goater
 <clg@kaod.org>,  Stefan Hajnoczi <stefanha@redhat.com>,  Qemu-block
 <qemu-block@nongnu.org>,  Eduardo Habkost <eduardo@habkost.net>,
 =?utf-8?Q?Herv=C3=A9?=
 Poussineau <hpoussin@reactos.org>,  "open list:New World"
 <qemu-ppc@nongnu.org>,  Cornelia Huck <cohuck@redhat.com>,  Helge Deller
 <deller@gmx.de>,  Stefano Stabellini <sstabellini@kernel.org>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  "open list:RISC-V"
 <qemu-riscv@nongnu.org>,  Stafford Horne <shorne@gmail.com>,  Paul Durrant
 <paul@xen.org>,  Havard Skinnemoen <hskinnemoen@google.com>,  Elena
 Ufimtseva <elena.ufimtseva@oracle.com>,  Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>,  Alex Williamson
 <alex.williamson@redhat.com>,  Wenchao Wang <wenchao.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  qemu-s390x <qemu-s390x@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Mark
 Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Eric Farman <farman@linux.ibm.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,  Alexander Bulekov <alxndr@bu.edu>,
 Yanan Wang <wangyanan55@huawei.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Tyrone
 Ting <kfting@nuvoton.com>,  "open list:X86"
 <xen-devel@lists.xenproject.org>,  Yoshinori Sato
 <ysato@users.sourceforge.jp>,  John Snow <jsnow@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Darren Kenny
 <darren.kenny@oracle.com>,  "open list:Overall" <kvm@vger.kernel.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,  John G Johnson
 <john.g.johnson@oracle.com>,  Sunil Muthuswamy <sunilmut@microsoft.com>,
 Max Filippov <jcmvbkbc@gmail.com>,  qemu-arm <qemu-arm@nongnu.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Anthony Perard <anthony.perard@citrix.com>,
 Andrew Jeffery <andrew@aj.id.au>,  Artyom Tarasenko
 <atar4qemu@gmail.com>,  Halil Pasic <pasic@linux.ibm.com>,  "Maciej S.
 Szmigiero" <maciej.szmigiero@oracle.com>,  Jason Wang
 <jasowang@redhat.com>,  David Hildenbrand <david@redhat.com>,  Laurent
 Vivier <laurent@vivier.eu>,  Alistair Francis <alistair@alistair23.me>,
 Jason Herne <jjherne@linux.ibm.com>
Subject: Re: [PATCH 1/9] hw/riscv/sifive_e: Fix inheritance of SiFiveEState
References: <20220919231720.163121-1-shentey@gmail.com>
 <20220919231720.163121-2-shentey@gmail.com>
 <CAKmqyKN+V2R8PkED67tB8+pCZs9369ViiL8OZ9XhO3SdUCk5=Q@mail.gmail.com>
Date: Tue, 20 Sep 2022 13:36:47 +0200
In-Reply-To: <CAKmqyKN+V2R8PkED67tB8+pCZs9369ViiL8OZ9XhO3SdUCk5=Q@mail.gmail.com>
 (Alistair Francis's message of "Tue, 20 Sep 2022 09:31:10 +1000")
Message-ID: <87edw6xoog.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alistair Francis <alistair23@gmail.com> writes:

> On Tue, Sep 20, 2022 at 9:18 AM Bernhard Beschow <shentey@gmail.com> wrote:
>>
>> SiFiveEState inherits from SysBusDevice while it's TypeInfo claims it to
>> inherit from TYPE_MACHINE. This is an inconsistency which can cause
>> undefined behavior such as memory corruption.
>>
>> Change SiFiveEState to inherit from MachineState since it is registered
>> as a machine.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

To the SiFive maintainers: since this is a bug fix, let's merge it right
away.


