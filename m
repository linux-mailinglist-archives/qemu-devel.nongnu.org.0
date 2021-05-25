Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC62390BC2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 23:45:09 +0200 (CEST)
Received: from localhost ([::1]:56756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llerL-0006KV-Jw
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 17:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lleq5-0005e6-Jm
 for qemu-devel@nongnu.org; Tue, 25 May 2021 17:43:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lleq2-00015H-Hm
 for qemu-devel@nongnu.org; Tue, 25 May 2021 17:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621979024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yLwpEgMvAHXbNeYOfXIWSjM/CB63m06JMbhh2KSRSME=;
 b=Sb0ZdaZvmJN4VkwuIOgBa9c0YOGlVFjJgsrSaAjnPJuCk7RPCnwOa4EofvD9hufNpW8dWB
 CnYoLgXV5L+DYYHr7aOrbVJO4nF8MQdGm72sKbxBCA8I/vW29+b6qgaRiyFIhB+Tscozzv
 3qlvvDFcMDxG46nBeyKRxMRlmUPjqU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-oiHeKwbqM1iVHS81EDGRZg-1; Tue, 25 May 2021 17:43:41 -0400
X-MC-Unique: oiHeKwbqM1iVHS81EDGRZg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 091EA107ACE4;
 Tue, 25 May 2021 21:43:40 +0000 (UTC)
Received: from localhost (unknown [10.40.208.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EABA41002F12;
 Tue, 25 May 2021 21:43:26 +0000 (UTC)
Date: Tue, 25 May 2021 23:43:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
Message-ID: <20210525234324.050c0f5b@redhat.com>
In-Reply-To: <CO1PR10MB45317C1FA7B7EF0229AC1B0397259@CO1PR10MB4531.namprd10.prod.outlook.com>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
 <1612817879-21511-4-git-send-email-eric.devolder@oracle.com>
 <20210406213131.21045f68@redhat.com>
 <CO1PR10MB4531392E4B963B163A0FC89C97739@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210414111759.66e78f71@redhat.com>
 <CO1PR10MB4531ACA8EFC99E57809E1499975B9@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210503190734.12e4c1ac@redhat.com>
 <CO1PR10MB453130B44F61C9E82C431789972D9@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210517183138.5a429692@redhat.com>
 <CO1PR10MB4531D0D81AEDA7FD7F10DF19972C9@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210520130047.1a89d520@redhat.com>
 <CO1PR10MB45317C1FA7B7EF0229AC1B0397259@CO1PR10MB4531.namprd10.prod.outlook.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 Konrad Wilk <konrad.wilk@oracle.com>, "mst@redhat.com" <mst@redhat.com>,
 "jusual@redhat.com" <jusual@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, dgilbert@redhat.com,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 May 2021 20:22:26 +0000
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Igor,
> Thank you for the pointers, I've turned the corner on the use of hostmem-file and am able to use it now!
> I do have one question regarding hostmem-file. In the VMStateDescription, I used to have this for the contents
> of the nvram (backed by a file):
> 
>           VMSTATE_VARRAY_UINT32(nvram, ERSTDeviceState, prop_size, 0,
>             vmstate_info_uint8, uint8_t),
> 
> I've searched and I do not locate an example of passing a HostMemoryBackend object; how do I do that?

if I'm not wrong, you do not need to do it, i.e. treat backing file as any other storage,
i.e. put it on shared storage were VM's hard disks are located so source and target host can access it.

alternatively you can mark MemoryRegion as migratable, which will make QEMU stream its content
over migration socket automatically. In that case file associated with backend doesn't need to
be shared between source and target hosts. I think this option is fine if file in question is small,
but others might think otherwise. (obvious drawback is that it increases migration time)

CCed David as he might have an opinion about it from migration point of view.


> Thanks,
> eric
> 
> 
[...]


