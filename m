Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672314F758A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 08:00:25 +0200 (CEST)
Received: from localhost ([::1]:46130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncLBu-0002b0-AK
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 02:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ncL7o-0000Q6-7z
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 01:56:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ncL7k-0001JN-Ka
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 01:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649310963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTEj3m0eg28EJEPg1X+ksgrSGGgbL6z5OR3uMdaTNqQ=;
 b=AJ073ySr4b8lWrpVNeINuwt4LFB5n0Rew6AeJqxbXO/ILOHrGt6jUATtYhtlQphXqbNLQS
 /gttDgK2wtkxXd67FzCkpSDmUNJkpyE7M8XS9N3AgXHgEOO+IBU+FExlifXkKZDzQor2w1
 nv6VsGhlgB2VRaMMmQ4R93ILviPnsr4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-fmWGcE7nNF6WB5PY1tKI3w-1; Thu, 07 Apr 2022 01:55:59 -0400
X-MC-Unique: fmWGcE7nNF6WB5PY1tKI3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 184D73C11C95;
 Thu,  7 Apr 2022 05:55:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7BE3145BA46;
 Thu,  7 Apr 2022 05:55:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D5D1B21E6A21; Thu,  7 Apr 2022 07:55:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Cole Robinson <crobinso@redhat.com>
Subject: Re: [PATCH v3] qapi, target/i386/sev: Add cpu0-id to
 query-sev-capabilities
References: <20220228093014.882288-1-dovmurik@linux.ibm.com>
 <YhyWg1UaOPMIkODz@redhat.com>
 <982bd5bf-a3a8-f75c-73bd-2722f72cc476@linux.ibm.com>
 <9878f830-d581-1069-5b06-54b8486b7b8b@redhat.com>
Date: Thu, 07 Apr 2022 07:55:57 +0200
In-Reply-To: <9878f830-d581-1069-5b06-54b8486b7b8b@redhat.com> (Cole
 Robinson's message of "Wed, 6 Apr 2022 13:19:48 -0400")
Message-ID: <87v8vljv2q.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cole Robinson <crobinso@redhat.com> writes:

> On 2/28/22 4:39 AM, Dov Murik wrote:
>>=20
>>=20
>> On 28/02/2022 11:31, Daniel P. Berrang=C3=A9 wrote:
>>> On Mon, Feb 28, 2022 at 09:30:14AM +0000, Dov Murik wrote:
>>>> Add a new field 'cpu0-id' to the response of query-sev-capabilities QM=
P
>>>> command.  The value of the field is the base64-encoded unique ID of CP=
U0
>>>> (socket 0), which can be used to retrieve the signed CEK of the CPU fr=
om
>>>> AMD's Key Distribution Service (KDS).
>>>>
>>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>>
>>> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>>>
>>=20
>> Thanks Daniel for reviewing.
>>=20
>
> Hmm I don't see this in qemu.git. Who should pick this up?

I'd say

    $ scripts/get_maintainer.pl -f target/i386/sev.c=20
    Paolo Bonzini <pbonzini@redhat.com> (supporter:X86 KVM CPUs)
    Marcelo Tosatti <mtosatti@redhat.com> (supporter:X86 KVM CPUs)
    kvm@vger.kernel.org (open list:X86 KVM CPUs)
    qemu-devel@nongnu.org (open list:All patches CC here)


