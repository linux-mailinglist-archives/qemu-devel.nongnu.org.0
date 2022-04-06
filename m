Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4984F5BC2
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 12:47:04 +0200 (CEST)
Received: from localhost ([::1]:44300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc3Bn-0005JF-GN
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 06:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nc3AO-0003uT-5w
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 06:45:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nc3AL-0007sx-By
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 06:45:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649241932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugBjFme6Tz0mv1Hm4wpbefwSklpAUmZcDU57eVJ7dYg=;
 b=hfGsqLlPRaaEyI1Neba8+Pd8GiiRMysjs23rf7skxleF6AoofDifzdCg9Z8U0u9/aToGPe
 pPgSiSA1ZJW1c7LkQ90oNobC9pbaQL5fctkq5qJeMlbhOqBZSEWSrk5g5xBtd64WfId3DT
 Ax08SmEMdnOFwJCUF6thZBUfIRO+kjI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-OM1aiwbgMuiuhMqtFjCKTw-1; Wed, 06 Apr 2022 06:45:29 -0400
X-MC-Unique: OM1aiwbgMuiuhMqtFjCKTw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 026011C1C520;
 Wed,  6 Apr 2022 10:45:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFC12C27E84;
 Wed,  6 Apr 2022 10:45:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 961B121E6A00; Wed,  6 Apr 2022 12:45:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 32/32] Remove qemu-common.h include from most units
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-33-marcandre.lureau@redhat.com>
 <CAARzgwzXXKqhvP9CnST3iD_obfqCWn8Z+8WNcs0u-O_UGoM1-w@mail.gmail.com>
Date: Wed, 06 Apr 2022 12:45:19 +0200
In-Reply-To: <CAARzgwzXXKqhvP9CnST3iD_obfqCWn8Z+8WNcs0u-O_UGoM1-w@mail.gmail.com>
 (Ani Sinha's message of "Tue, 5 Apr 2022 20:32:28 +0530")
Message-ID: <87o81epk1s.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Li Zhijian <lizhijian@fujitsu.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "open list:raw" <qemu-block@nongnu.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Alex =?utf-8?Q?Benn?= =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Chris Wulff <crwulff@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Zhang Chen <chen.zhang@intel.com>,
 "open list:sPAPR \(pseries\)" <qemu-ppc@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Corey Minyard <minyard@acm.org>, Stefan Weil <sw@weilnetz.de>,
 Julia Suvorova <jusual@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Bandan Das <bsd@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Michael Rolnik <mrolnik@gmail.com>,
 =?utf-8?Q?C=C3=A9?= =?utf-8?Q?dric?= Le Goater <clg@kaod.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "open list:S390-ccw boot" <qemu-s390x@nongnu.org>,
 Tyrone Ting <kfting@nuvoton.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
 Wenchao Wang <wenchao.wang@intel.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Colin Xu <colin.xu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 "open list:X86 HAXM CPUs" <haxm-team@intel.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Jagannathan Raman <jag.raman@oracle.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Kyle Evans <kevans@freebsd.org>,
 marcandre.lureau@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Eric Auger <eric.auger@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Marcelo Tosatti <mtosatti@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First of all: thank you so much for completing the "empty out
qemu-common.h" job!

This is what's left:

    #ifndef QEMU_COMMON_H
    #define QEMU_COMMON_H

    /* Copyright string for -version arguments, About dialogs, etc */
    #define QEMU_COPYRIGHT "Copyright (c) 2003-2022 " \
        "Fabrice Bellard and the QEMU Project developers"

    /* Bug reporting information for --help arguments, About dialogs, etc */
    #define QEMU_HELP_BOTTOM \
        "See <https://qemu.org/contribute/report-a-bug> for how to report b=
ugs.\n" \
        "More information on the QEMU project at <https://qemu.org>."

    #endif

Rename the header?  Or replace the macros by variables, and move their
declarations elsewhere?  Not demands; this series is lovely progress as
is.

Ani Sinha <ani@anisinha.ca> writes:

> On Wed, Mar 23, 2022 at 9:32 PM <marcandre.lureau@redhat.com> wrote:
>
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>
> Empty patch descriptions are not a good idea. Please explain why this
> removal does not break things and maybe why the header got included
> initiatively.

Something like

    The previous commits moved most of qemu-common.h's contents
    elsewhere.  Most inclusions are now useless.  Remove them.

would do for me.


