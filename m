Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC1D15BCE4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 11:33:37 +0100 (CET)
Received: from localhost ([::1]:50266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2BoO-0005rh-NG
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 05:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53160)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j2BmJ-0003zw-PH
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 05:31:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j2BmI-0002NE-KB
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 05:31:27 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60804
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j2BmI-0002Ms-GG
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 05:31:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581589885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e1s+y+cQVnUb4eWnJjEwWdaYvw25wTAvnzuqbrxRbQM=;
 b=KTfy8QiKa0zo6TK8zTZ+59IrP0WYBy01vLYfsWR1zk75bIZ/Sj01P17EgjSsns/R4kPU4b
 b5wYAmwFZ3xpQJHNKhn08+yMkzmqar0DWGmH65fm9MVyvE0/oYBazonYE9rRpHqlKVMPuj
 gM2AraTpmuchOg6DJvTsYxU7brIRHKM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-v8p5_GpzPRO14bh0jG8U8g-1; Thu, 13 Feb 2020 05:31:23 -0500
Received: by mail-wm1-f71.google.com with SMTP id p26so1836853wmg.5
 for <qemu-devel@nongnu.org>; Thu, 13 Feb 2020 02:31:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=efOADJ6Sz9pojASgvBXPhSQrHlI0pMigW/kcYO9dwGY=;
 b=Ft1JxB7fRcnTGCgoV2PUZqeJp5It8owDmrd7IeGD+9pYAqOuWV3tO/PO7tR8O+7Icd
 1j7k8ZjErje/bVh01AUShb/PFZsrzoV9uugs+7VFKieHycc3nX/UldOVxCYJYWCnmzCJ
 HLwTPUBAn07wAhD5jdbtDyaP+moVoW4lLY191rRlACy+rqRHFDx4vl2YEX5OXaZ+POpY
 T5gbOmC/NEkQTjbtMWUp1gZ8V/FUHBQ6aArSQA3VMbqMkimVPswhUDhrXyk6PMi9hVMb
 LmekdHcvMpmHgnuqUQorNez0J9lyYitWEikogIjkJruy9YrfF3AADeSv5a6GY6pRM01E
 c94A==
X-Gm-Message-State: APjAAAUJIzPMCzlvFTxW1dJWPnlkya/c+L27FXK2gJyfuNGnh/xbAhf9
 aQ/482Ya9fDliz2WvCWceDYxnh+lJCpYrcgGDHLTkXI5BwrqZBZ/lN+/eMl3Xz9xkhyXzoyHFCn
 NXRLs1pSyjsUlcG4=
X-Received: by 2002:adf:ffc5:: with SMTP id x5mr21606657wrs.92.1581589881932; 
 Thu, 13 Feb 2020 02:31:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqwEHl3GTjUDfk5Cv4HjS3RK3QKl1j5j5OkyOsLAaZId5u7m5gdASamdJu1kQUx6f0nWIVX1UA==
X-Received: by 2002:adf:ffc5:: with SMTP id x5mr21606626wrs.92.1581589881683; 
 Thu, 13 Feb 2020 02:31:21 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:48f0:7b10:ad88:6d83?
 ([2001:b07:6468:f312:48f0:7b10:ad88:6d83])
 by smtp.gmail.com with ESMTPSA id r5sm2260356wrt.43.2020.02.13.02.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 02:31:21 -0800 (PST)
Subject: Re: [PATCH] docs: Fix virtiofsd.1 location
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <1908428819.7192207.1581512184275.JavaMail.zimbra@redhat.com>
 <1608747495.7195569.1581513386780.JavaMail.zimbra@redhat.com>
 <CAFEAcA-F-F1C4si7OXNkMnzE+9DHXtNnvCYv1eTx-nEpb4_OZw@mail.gmail.com>
 <20200212142832.GC434563@redhat.com>
 <CAFEAcA_VsdWJELxDuMJW9iaRsB-At_Dyf3Z6paOHWEp+VEhSgw@mail.gmail.com>
 <625cd959-6031-0a27-f25b-e2be6dc7ec3a@redhat.com>
 <CAFEAcA97NfPA+yZThojcaYWqdS8kvFtDNYJRn96iRuRMaU-uMg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20a55761-f76a-b897-4f76-8bc95fdc1374@redhat.com>
Date: Thu, 13 Feb 2020 11:31:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA97NfPA+yZThojcaYWqdS8kvFtDNYJRn96iRuRMaU-uMg@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: v8p5_GpzPRO14bh0jG8U8g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/02/20 18:51, Peter Maydell wrote:
> On Wed, 12 Feb 2020 at 16:51, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
>> We stopped testing in-tree builds 2 months ago:
>>
>> commit bc4486fb233573e77b6e9ad6d6379afb5e37ad8c
>> Author: Paolo Bonzini <pbonzini@redhat.com>
>> Date:   Wed Dec 11 15:33:49 2019 +0100
>>
>>      ci: build out-of-tree
>>
>> Most developers are using out-of-tree builds and it was discussed=20
>> in the past to only allow those.  To prepare for the transition,
>> use out-of-tree builds in all continuous integration jobs.
>
> I'd missed that. Paolo, do you have a plan for following
> through and actively forbidding in-tree-builds, if that's
> the route we're taking ?

I can follow up on that, yes.

Paolo


