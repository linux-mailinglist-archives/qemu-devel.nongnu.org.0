Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88CC5337D4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 09:53:32 +0200 (CEST)
Received: from localhost ([::1]:48000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntlpk-00020Y-0H
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 03:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ntlmS-00011T-K8
 for qemu-devel@nongnu.org; Wed, 25 May 2022 03:50:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ntlmP-0000Ex-I9
 for qemu-devel@nongnu.org; Wed, 25 May 2022 03:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653465004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2K1da7xcYqaox748ZT2YnR3Y8xovTNHAqyueezVtiQ4=;
 b=f/jPECFHf4qRVwElNyLf5DBxBI1MXiODI6XTf2uo4LcTFSw0scLglJ8kJOqKNvHQmhA0Tt
 W1L47Ac/00UX602T0xcX15KEUPbgerIYWf4s1ys0d5NHzMUPH0gaGeElWCjsoODAy+ID2Z
 CG0qaCI7XgUU/OLjDXsKO7QkVtpJHnw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-PtVD3wXzM9mkow8VpkdfBQ-1; Wed, 25 May 2022 03:49:58 -0400
X-MC-Unique: PtVD3wXzM9mkow8VpkdfBQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83C021C05AE3;
 Wed, 25 May 2022 07:49:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EF7B2026D64;
 Wed, 25 May 2022 07:49:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1A91A21E6906; Wed, 25 May 2022 09:49:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH 7/8] qmp: add filtering of statistics by name
References: <20220523150509.349412-1-pbonzini@redhat.com>
 <20220523150722.349700-1-pbonzini@redhat.com>
 <20220523150722.349700-7-pbonzini@redhat.com>
 <87mtf7w00s.fsf@pond.sub.org>
 <596096e7-1717-99e6-1c1c-58b4392fb083@redhat.com>
Date: Wed, 25 May 2022 09:49:57 +0200
In-Reply-To: <596096e7-1717-99e6-1c1c-58b4392fb083@redhat.com> (Paolo
 Bonzini's message of "Tue, 24 May 2022 18:49:13 +0200")
Message-ID: <87y1yqqcey.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 5/24/22 15:08, Markus Armbruster wrote:
>>> -typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
>>> +                              strList *names, strList *targets, Error **errp);
>>> +typedef void SchemaRetrieveFunc(StatsSchemaList **, Error **);
>>
>> Did you drop the parameter names intentionally? 
>
> No, I didn't.

Easy enough to revert :)

>>> +                    /* No names allowed is the same as skipping the provider.  */
>>
>> Long line.
>> 
>>> +                    return false;
>>
>> Any other elements of filter->providers that match @provider will be
>> silently ignored.  Is this what you want?
>
> Hmm, key/value pairs are ugly in QMP.

Funny, considering what JSON objects are, isn't it?

Ways to do maps in QMP:

1. You can always use a JSON array of objects.  Any combination of
members can be a key.  Any semantic constaint "keys are unique" you get
to enforce manually.

2. If the key is a string, you can use a JSON object.

In either case, you may or may not be able to define a compile-time
static schema.  If you are, then 1.'s schema can be ['UnionType'], where
the key is in the UnionType's base, and 2.'s can be a struct with
optional members.  Else, you get to play with 'any', I guess.

> I'll see if I can make it work nicely without inlining stats_provider_requested() in the caller.
>
>> Uh, do we leak @p_names if earlier elements matched?
>
> No, it's not copied so there are no leaks.


