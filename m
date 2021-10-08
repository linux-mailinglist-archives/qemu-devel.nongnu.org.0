Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70762426F5D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 19:08:57 +0200 (CEST)
Received: from localhost ([::1]:46886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYtMe-0000vr-1U
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 13:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYtLo-0000FA-4B
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 13:08:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYtLk-0000sj-Vh
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 13:08:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633712878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UVAIo2ADsw0vypeXj37cz5w4DmA8NSiFIUkk7xe/CeI=;
 b=Kpp0NQHzJQwiWQ6X9vF0nyCfUOuRwhvTrhoqI0TuEz/GgkWHRQjGziQqx7I3qY8To1HmKP
 aHFNnclO1L0kiFvB7kKdGdu3OPqQO9bRaKN6BI0uk2gaUQZMPlZ0vCo5gTXhvcVeOppnuP
 ysF1x7wnGRhqN9wwi/M7nGvNCLtvos0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-2Qv0SXvyN9mPZBsyCfvEtg-1; Fri, 08 Oct 2021 13:07:57 -0400
X-MC-Unique: 2Qv0SXvyN9mPZBsyCfvEtg-1
Received: by mail-ed1-f69.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso9745933edj.20
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 10:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UVAIo2ADsw0vypeXj37cz5w4DmA8NSiFIUkk7xe/CeI=;
 b=GWICcPVLu+mtawgue/iDUuufUE+suEgNSJySTItPXZZZVctwSUTwtOkzC+SZa5upIN
 c68iHhUgcN8/B3OnvY0v78H30T5Kh1RRdKW8Vud37r6gvIkM8/QAyosQ74DUFMRV++J7
 AT5/JbLj+OXKDz0ib7mW9p0KlEHYTYHtoZ5uX93oOWZDgWL/uiVBAYiUC9P5Fa6hPOzq
 iSjJh/EE9TbmnX3qPaFQ4tFV8zCXA80q3LFB4Gcn8LZHGvQ1CJP+NPdX9eVk6fFu7g5R
 Aid2M8pEjYlenW1k/VJMmh4+XisgbGiWe9XkFHWdpC9QlfYC9RaGYERPcsgyOO4HVkFK
 MIiQ==
X-Gm-Message-State: AOAM533EJYIkZY+zJUPynZpXvHLU0HVxVUCgX1lDSdX6/+/kr7hqH5Yt
 Cx8gWqWjdgNo19yu/qAPsl+FhP/0EHOnmW3YIYxKvWPejlHshFRaY6FT3jI1xDzuXqhLTmMqNgw
 EF9Ju5/xr7pJNogs=
X-Received: by 2002:a17:906:5010:: with SMTP id
 s16mr5710065ejj.245.1633712876447; 
 Fri, 08 Oct 2021 10:07:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD4ZjD33VbDMKqstundvJTEzlN691atftkgW5G2gfBYMoko3hOm4XHY129ow8wRzLwdl86YA==
X-Received: by 2002:a17:906:5010:: with SMTP id
 s16mr5710038ejj.245.1633712876231; 
 Fri, 08 Oct 2021 10:07:56 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id k22sm1140491eje.89.2021.10.08.10.07.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 10:07:55 -0700 (PDT)
Message-ID: <f98f556c-6fa9-0931-4504-874a4a7c6741@redhat.com>
Date: Fri, 8 Oct 2021 19:07:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: QAPI sync meeting
To: Markus Armbruster <armbru@redhat.com>
References: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
 <YVMeUbGdnsTpwSbD@redhat.com>
 <CAFn=p-ZG6SAVDz-cOtviekvMvibw+ukhYmSOqH7UTrcH-9fCNA@mail.gmail.com>
 <87ee97y3q5.fsf@dusky.pond.sub.org> <YV7Fh2DihM65rgnN@redhat.com>
 <3abc4e8e-5657-14bb-ba89-5b7669c01201@redhat.com>
 <87bl3z96g0.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87bl3z96g0.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/10/21 12:06, Markus Armbruster wrote:
> 
>>                                     and I'd rather use
>> -object/object-add for chardevs if that's at all possible.
> How far are we from making -object the preferred machine-friendly
> interface for creating character devices?

I'd guess a week of work if somebody could just dive in.  Plus then of 
course getting the patch in and the Libvirt enablement.

That said, I'm not going to be able to "dive in" for quite some time. 
My main goal was compound machine properties which were needed for SGX, 
and that has been achieved.

Paolo


