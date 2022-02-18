Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715C04BBE87
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 18:37:58 +0100 (CET)
Received: from localhost ([::1]:50702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL7Cf-0003Dh-Ha
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 12:37:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nL7B3-00011y-6w
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 12:36:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nL7Au-0006RZ-LV
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 12:36:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645205767;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=3Wf6VRULO7kb7tZlyTTtzD9V0u6M9eTELN7mxdGz3DI=;
 b=A1BuifNRFku89d16B5wBffT9uXlJ6hN0cb1g8ICN+g6t8vpxFOcLrw2mqd3Xu2NP7LFQAY
 3FbjtZpteyESeAym4oSH4H7ziibeeZMmQG2IznvFTYyuNkhdEMqMor+2/To50rL6SSkgow
 Q0qp+losCbVgjdtwmDiTC+ibfCJ54Zs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-Ftv3RnBiNNe3jw5VgWrt2Q-1; Fri, 18 Feb 2022 12:36:06 -0500
X-MC-Unique: Ftv3RnBiNNe3jw5VgWrt2Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 p9-20020adf9589000000b001e333885ac1so3830301wrp.10
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 09:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=3Wf6VRULO7kb7tZlyTTtzD9V0u6M9eTELN7mxdGz3DI=;
 b=mSFpsI62CSJLPCTb3v9l4inNnrYye3r3A1jLwVStsrbe38ls4PRfXrQFmbCaXDlQKD
 4Ao+2fe4gbY3A+suKIsfy0cFgX10VUGoueVUBYE9lhUDxjTSplHikCFFDBZRjiSVDyLZ
 Yosuubq2ptHB6qp36tvzks3Km4JWhpCXPoDuA628BzU1mGgffX5/Hp223cHTxtChwo9i
 wk6zTgBI+Dpqd4jOrglYzbOeoa7avsRm5N6G/Ub+y2zZ6IXCPAsAP2jSf2y6cg3k5CYi
 qnyhQoJ/6EdwwTkoSFN1N3vgyNd5OPqk5BydRMLdsJo6W4jeg+VfHvTiMTam0t2XmyWM
 IJXg==
X-Gm-Message-State: AOAM533ETqbIDJT0V8uN9xW6KW0+/RpLi4YcXvrC59V8NTNzSbg9j50H
 SMFyvUyo0KMBk9dTYZklUqEIQMpGK5u9LHWnE6ASB2JJlLsotxndCVGeUbQDUxLpWM+OQuW7ZFE
 zc16GrEXAfXu3E4A=
X-Received: by 2002:adf:fac9:0:b0:1e3:2f82:aa0c with SMTP id
 a9-20020adffac9000000b001e32f82aa0cmr6571753wrs.528.1645205764819; 
 Fri, 18 Feb 2022 09:36:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTO+1Vu9nuopzRuCc9D6lu4JJcsXIi9L+mCWbOGmG/S3tQaXkugIim+uffPpJnmlMZkNWdKg==
X-Received: by 2002:adf:fac9:0:b0:1e3:2f82:aa0c with SMTP id
 a9-20020adffac9000000b001e32f82aa0cmr6571728wrs.528.1645205764547; 
 Fri, 18 Feb 2022 09:36:04 -0800 (PST)
Received: from localhost (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a05600c4f0c00b00352cf3078e6sm28125wmq.22.2022.02.18.09.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 09:36:04 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v8 5/5] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
In-Reply-To: <CAJ6HWG44WaWmCopWvF6-vbzMg8A-QWV85Vv2VmgEA7cs4CfM3Q@mail.gmail.com>
 (Leonardo Bras Soares Passos's message of "Mon, 7 Feb 2022 23:49:38
 -0300")
References: <20220201062901.428838-1-leobras@redhat.com>
 <20220201062901.428838-6-leobras@redhat.com>
 <YgHT2AzvnHYun6j4@xz-m1.local>
 <CAJ6HWG44WaWmCopWvF6-vbzMg8A-QWV85Vv2VmgEA7cs4CfM3Q@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 18 Feb 2022 18:36:03 +0100
Message-ID: <87v8xcaxh8.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Bras Soares Passos <leobras@redhat.com> wrote:
> Hello Peter, thanks for reviewing!
>
> On Mon, Feb 7, 2022 at 11:22 PM Peter Xu <peterx@redhat.com> wrote:
>>
>> On Tue, Feb 01, 2022 at 03:29:03AM -0300, Leonardo Bras wrote:
>> > -void multifd_send_sync_main(QEMUFile *f)
>> > +int multifd_send_sync_main(QEMUFile *f)
>> >  {
>> >      int i;
>> > +    bool flush_zero_copy;
>> >
>> >      if (!migrate_use_multifd()) {
>> > -        return;
>> > +        return 0;
>> >      }
>> >      if (multifd_send_state->pages->num) {
>> >          if (multifd_send_pages(f) < 0) {
>> >              error_report("%s: multifd_send_pages fail", __func__);
>> > -            return;
>> > +            return 0;
>>
>> I've not checked how it used to do if multifd_send_pages() failed, but.. should
>> it returns -1 rather than 0 when there will be a return code?
>
> Yeah, that makes sense.
> The point here is that I was trying not to modify much of the current behavior.

    if (qatomic_read(&multifd_send_state->exiting)) {
        return -1;
    }

        if (p->quit) {
            error_report("%s: channel %d has already quit!", __func__, i);
            qemu_mutex_unlock(&p->mutex);
            return -1;
        }

This are the only two cases where the current code can return one
error.  In the 1st case we are exiting, we are already in the middle of
finishing, so we don't really care.
In the second one, we have already quit, and error as already quite big.

But I agree with both comments:
- we need to improve the error paths
- leonardo changes don't affect what is already there.


> I mean, multifd_send_sync_main() would previously return void, so any
> other errors would not matter to the caller of this function, which
> will continue to run as if nothing happened.
>
> Now, if it fails with flush_zero_copy, the operation needs to be aborted.
>
> Maybe, I should make it different:
> - In any error, return -1.
> - Create/use a specific error code in the case of a failing
> flush_zero_copy, so I can test the return value for it on the caller
> function and return early.

We need to add the check.  It don't matter if the problem is zero_copy
or the existing one, we are under a minor catastrophe and migration has
to be aborted.

> Or alternatively, the other errors could also return early, but since
> this will change how the code currently works, I would probably need
> another patch for that change. (so it can be easily reverted if
> needed)
>
> What do you think is better?
>
>
>> >          }
>> >      }
>> > +
>> > +    /*
>> > +     * When using zero-copy, it's necessary to flush after each iteration to
>> > +     * make sure pages from earlier iterations don't end up replacing newer
>> > +     * pages.
>> > +     */
>> > +    flush_zero_copy = migrate_use_zero_copy_send();
>> > +
>> >      for (i = 0; i < migrate_multifd_channels(); i++) {
>> >          MultiFDSendParams *p = &multifd_send_state->params[i];
>> >
>> > @@ -591,7 +600,7 @@ void multifd_send_sync_main(QEMUFile *f)
>> >          if (p->quit) {
>> >              error_report("%s: channel %d has already quit", __func__, i);
>> >              qemu_mutex_unlock(&p->mutex);
>> > -            return;
>> > +            return 0;
>>
>> Same question here.
>
> Please see above,
>
>>
>> >          }
>>
>> The rest looks good.  Thanks,

Later, Juan.


