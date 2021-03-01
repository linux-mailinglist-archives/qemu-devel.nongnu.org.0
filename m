Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9921327F7B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 14:29:33 +0100 (CET)
Received: from localhost ([::1]:36984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGic8-00025K-RP
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 08:29:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGiZW-0000GI-7Z
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:26:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGiZT-000646-8r
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614605203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oPTqY57Bz8CwAVfzh6Ry0X5U58jECPFOqbq3RZY7AV0=;
 b=YpI/X06u0eK5Ic6UQzrSqZheVWl3VFfWbfkDtHQOWW53BLDbQyjxdyQ/KhXJZ5qDN+4jy6
 2kfyrZyztJqTPWwTkY4vs+glIAEVcrV8aLqIEJTAWdnl41qrsqclE6xISAj59Sk3QatY39
 Lt3vF4jAHWXdr7eZasCxrV1BI9di7HE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-UtFK0Oj1OY24ie2Wqqv5SA-1; Mon, 01 Mar 2021 08:26:42 -0500
X-MC-Unique: UtFK0Oj1OY24ie2Wqqv5SA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29501CC620
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 13:26:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDB8310016FF;
 Mon,  1 Mar 2021 13:26:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 85D2C113860F; Mon,  1 Mar 2021 14:26:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 27/29] vl: deprecate -writeconfig
References: <20210226080526.651705-1-pbonzini@redhat.com>
 <20210226080526.651705-28-pbonzini@redhat.com>
 <87r1kzl2vy.fsf@dusky.pond.sub.org>
 <94db680f-a43f-7f94-a897-5512ceef6b98@redhat.com>
Date: Mon, 01 Mar 2021 14:26:39 +0100
In-Reply-To: <94db680f-a43f-7f94-a897-5512ceef6b98@redhat.com> (Paolo
 Bonzini's message of "Mon, 1 Mar 2021 11:09:44 +0100")
Message-ID: <878s77hunk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 01/03/21 09:00, Markus Armbruster wrote:
>>> +                    warn_report("-writeconfig is deprecated.  It will go away in QEMU 6.2 with no replacement");
>>>                       if (strcmp(optarg, "-") == 0) {
>>>                           fp = stdout;
>>>                       } else {
>>
>> Forgot to tweak the warning to "-writeconfig is deprecated and will go
>> away without a replacement"?
>
> Didn't really forget; being pretty sure that there's no usage in the
> wild and having good reasons to remove the code, giving a firm removal 
> date should encourage people to speak up sooner rather than later.

Second thoughts after agreeing to change something are okay.  Keeping
them for yourself not so much, because it deprives your reviewers of a
chance to raise further points.

In this case, the point I didn't make because I wanted to reach
agreement on contents before nitpicking form: you're not using
warn_report() the way it wants to be used:

    /*
     * Print a warning message to current monitor if we have one, else to stderr.
     * Format arguments like sprintf(). The resulting message should be a
---> * single phrase, with no newline or trailing punctuation.
     * Prepend the current location and append a newline.
     */
    void warn_report(const char *fmt, ...)

Please tidy up.


