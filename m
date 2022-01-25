Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EE349ADB2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 08:38:40 +0100 (CET)
Received: from localhost ([::1]:42776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCGPX-00074P-B0
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 02:38:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCFTX-0004SU-FO
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 01:38:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCFTQ-0004UQ-1d
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 01:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643092714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pAotYi3bYpsPHAXKlbx58kye/EeNdHQraabdIBkZgdc=;
 b=LRfZzSJ+2FrtgiZEjt1RyAJySqCLA8SDCS3a/TWeGZs/+owfqjs0PolAa0s1iRnqdEEKDW
 CqmzYfTNflsmZbfNsDafgOXkh9qetcBE6IsUm+i+Dy6oyP8BjUQWquywVLFQc5MDE6fXHt
 V4tesLyvJyDSKob7rZABBQ1QqIhG6HE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-UlsPS9STPf6dl5WINPkbsg-1; Tue, 25 Jan 2022 01:38:28 -0500
X-MC-Unique: UlsPS9STPf6dl5WINPkbsg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99FF18189CC;
 Tue, 25 Jan 2022 06:38:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-3.ams2.redhat.com [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D60794EC6E;
 Tue, 25 Jan 2022 06:38:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 442F41138640; Tue, 25 Jan 2022 07:38:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: RFC: QMP configuration - allocating/setting qdev array properties?
References: <cccba1ec-34c7-73da-1100-416a0afa8cea@greensocs.com>
 <cd48c959-9262-cc42-73c0-3d10a4bd44b1@greensocs.com>
 <87ee543uh8.fsf@dusky.pond.sub.org>
 <CAFn=p-Y1um_4k33XRPshWy6QjvMGvhq_tfR+s8EFBTFwhkBnrQ@mail.gmail.com>
Date: Tue, 25 Jan 2022 07:38:24 +0100
In-Reply-To: <CAFn=p-Y1um_4k33XRPshWy6QjvMGvhq_tfR+s8EFBTFwhkBnrQ@mail.gmail.com>
 (John Snow's message of "Mon, 24 Jan 2022 14:09:01 -0500")
Message-ID: <87lez45nhb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel <qemu-devel@nongnu.org>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On Wed, Jan 19, 2022 at 5:12 AM Markus Armbruster <armbru@redhat.com> wrote:

[...]

>> Another stop gap solution could be making QDict iterate in insertion
>> order, like Python dict does since 3.6.
>>
>
> I like this idea, I think. Are there any possible downsides here?
> Making the order more 'stable' in one regard might lead to people
> trusting it "too often" if there are other implementation details that
> might impact the order ... but I don't actually have any examples
> handy for that. It's just my fear.

For what it's worth, it took Python just one release cycle to overcome
this fear :)


