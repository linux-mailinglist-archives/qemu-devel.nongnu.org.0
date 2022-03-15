Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28134D9CA7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:51:24 +0100 (CET)
Received: from localhost ([::1]:39666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU7a7-0005BQ-8C
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:51:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nU7YX-0003NN-OY
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 09:49:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nU7YU-0000Xr-5I
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 09:49:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647352181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5HlQ4H+cbLWxhYmsVyucCORxv3SL1m40NFO11ExzIrY=;
 b=GVufNkuacXagA8pTrioB7mXvyo1bkE8zJShX2HqpG9YrvxaXSibhwqBTizjTQbrreectpL
 PcHp1DEVrSKs2hopZC8JwujY8Qi2Y0WfSydcdn/7UAwx5En1UK1jsPr0Zvvvqvm2OKGXMm
 jwWrzQxcE6fMwQy+GfwntEsO+qiC4aY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-LiPRJB8QPOiCtDGK4ztl3A-1; Tue, 15 Mar 2022 09:49:38 -0400
X-MC-Unique: LiPRJB8QPOiCtDGK4ztl3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3195780281B;
 Tue, 15 Mar 2022 13:49:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56CE3C44AE5;
 Tue, 15 Mar 2022 13:49:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2DEBE21E66CE; Tue, 15 Mar 2022 14:49:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-4-armbru@redhat.com>
 <877d8w5m9e.fsf@linaro.org>
Date: Tue, 15 Mar 2022 14:49:34 +0100
In-Reply-To: <877d8w5m9e.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Mon, 14 Mar 2022 19:48:47 +0000")
Message-ID: <87ilsfl40h.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Reinoud Zandijk <reinoud@netbsd.org>,
 Eric Blake <eblake@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Kamil Rytarowski <kamil@netbsd.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Amit Shah <amit@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, haxm-team@intel.com,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 qemu-ppc@nongnu.org, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Patrick Venture <venture@google.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Corey Minyard <cminyard@mvista.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Markus Armbruster <armbru@redhat.com> writes:
>
>> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
>> for two reasons.  One, it catches multiplication overflowing size_t.
>> Two, it returns T * rather than void *, which lets the compiler catch
>> more type errors.
>>
>> This commit only touches allocations with size arguments of the form
>> sizeof(T).
>>
>> Patch created mechanically with:
>>
>>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci=
 \
>> =09     --macro-file scripts/cocci-macro-file.h FILES...
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>

[...]

>> --- a/hw/pci/pcie_sriov.c
>> +++ b/hw/pci/pcie_sriov.c
>> @@ -177,7 +177,7 @@ static void register_vfs(PCIDevice *dev)
>>      assert(sriov_cap > 0);
>>      num_vfs =3D pci_get_word(dev->config + sriov_cap + PCI_SRIOV_NUM_VF=
);
>> =20
>> -    dev->exp.sriov_pf.vf =3D g_malloc(sizeof(PCIDevice *) * num_vfs);
>> +    dev->exp.sriov_pf.vf =3D g_new(PCIDevice *, num_vfs);
>>      assert(dev->exp.sriov_pf.vf);
>
> So what I find confusing about the conversion of sizeof(foo *) is that
> while the internal sizeof in g_new is unaffected I think the casting
> ends up as
>
>  foo **

Yes.  g_malloc(...) returns void *.  g_new(T, ...) returns T *.

> but I guess the compiler would have complained so maybe I don't
> understand the magic enough.

It doesn't complain here because dev->exp.sriov_pf.vf is of type
PCIDevice **:

    struct PCIESriovPF {
        uint16_t num_vfs;   /* Number of virtual functions created */
        uint8_t vf_bar_type[PCI_NUM_REGIONS];   /* Store type for each VF b=
ar */
        const char *vfname; /* Reference to the device type used for the VF=
s */
        PCIDevice **vf;     /* Pointer to an array of num_vfs VF devices */
    };

It does complain when the types don't match, as shown in PATCH 2.

> <snip>
>> index 42130667a7..598e6adc5e 100644
>> --- a/hw/rdma/vmw/pvrdma_dev_ring.c
>> +++ b/hw/rdma/vmw/pvrdma_dev_ring.c
>> @@ -41,7 +41,7 @@ int pvrdma_ring_init(PvrdmaRing *ring, const char *nam=
e, PCIDevice *dev,
>>      qatomic_set(&ring->ring_state->cons_head, 0);
>>      */
>>      ring->npages =3D npages;
>> -    ring->pages =3D g_malloc0(npages * sizeof(void *));
>> +    ring->pages =3D g_new0(void *, npages);
>
> At least here ring->pages agrees about void ** being the result.
>
> <snip>
>
> So other than my queries about the sizeof(foo *) which I'd like someone
> to assuage me of my concerns it looks like the script has done a
> thorough mechanical job as all good scripts should ;-)
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Thanks!


