Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA39321ADF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:13:11 +0100 (CET)
Received: from localhost ([::1]:52724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lECta-00015r-QU
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:13:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lECrN-0008DN-Pl
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:10:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lECrJ-0008TH-P6
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:10:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614006647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q1ZDZg5qXO/ovjJQEfadROd6YEF9o467CU1md96VuJ4=;
 b=hGBhWxQH2lZ+YOEZeMekltjkqfginFGw6y7VILVai6g4IJarmr5XOIx+V2EIVsoNln9LDj
 f71YdHW3VPnuCGm7WgRQTFlIA9Wa/3nKuJlSjnKXbEA3/FS8adH83055kaTkdBHaXqNrfR
 mjjvnK8howJqIp4T5OjGNq2h30493Ho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-LSIFhUMNM7CLdGFi8cHT0g-1; Mon, 22 Feb 2021 10:10:45 -0500
X-MC-Unique: LSIFhUMNM7CLdGFi8cHT0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D13DF801965;
 Mon, 22 Feb 2021 15:10:43 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09F6F60C04;
 Mon, 22 Feb 2021 15:10:38 +0000 (UTC)
Date: Mon, 22 Feb 2021 16:10:31 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: A brief look at deprecating our JSON extensions over RFC 8259
Message-ID: <20210222151031.GX2875719@angien.pipo.sk>
References: <875z2knoa5.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <875z2knoa5.fsf@dusky.pond.sub.org>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 15:57:22 +0100, Markus Armbruster wrote:
> We use JSON in several external interfaces:
> 
> * QMP
> 
> * The guest agent's QMP
> 
> * QAPIfied command line options when the option argument starts with
>   '{'
> 
> * The block layer's pseudo-protocol "json:" (which can get embedded in
>   image headers)
> 
> I *think* that's all.
> 
> The JSON parser we use for these interfaces supports extensions over RFC
> 8259.  Quoting json-lexer.c:
> 
>     - Extra escape sequence in strings:
>       0x27 (apostrophe) is recognized after escape, too
> 
>     - Single-quoted strings:
>       Like double-quoted strings, except they're delimited by %x27
>       (apostrophe) instead of %x22 (quotation mark), and can't contain
>       unescaped apostrophe, but can contain unescaped quotation mark.

[...]

> We could certainly tidy up the tests to stick to standard JSON.
> However, the prevalence of single-quoted strings in iotests makes me
> suspect that they are being used in the field as well.  Deprecating the
> extension is likely more trouble than it's worth.
> 
> Opinions?

Any user of QEMU through libvirt will not use any of the extensions even
in cases such as QMP command pasthrough (virsh qemu-monitor-command) and
the 'json:' pseudo-protocol, as libvirt parses the provided JSON to add
sequencing for QMP passthrough, and for image chain detection in case of
'json:'. Since libvirt's JSON library (yajl) doesn't support any of
those extensions users are forced to not use them.

So on behalf of libvirt, we'd be fine with deprecation/removal of those.


