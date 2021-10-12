Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD0C42A8F0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 17:58:33 +0200 (CEST)
Received: from localhost ([::1]:46042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKAi-0002QT-OX
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 11:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maK9M-0000sD-BY
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 11:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maK9I-0005xr-S6
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 11:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634054224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHWTkXfmArACEwVPmOUbhWfOz5eY2L3ygJncYzjpYQc=;
 b=OBUteOTwBo34/yi13buDsSASmWpQw/sfZ2vg/9j5OLRuR7pklUXLmsVDSzHCCoLk2jgkZZ
 DjuD7qrma/tuDI/o9w8+/7Orzte6os9yDgBhco2Uj399jmjz8UHQr3I5Gunnyd5cn4GP5w
 ax0oM4e4ZoeoJeTvElCGs2Swpwv7wKw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-Do5TISYbMzCwh6Gpjs-Ajg-1; Tue, 12 Oct 2021 11:57:02 -0400
X-MC-Unique: Do5TISYbMzCwh6Gpjs-Ajg-1
Received: by mail-wr1-f71.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso16076140wrg.1
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 08:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bHWTkXfmArACEwVPmOUbhWfOz5eY2L3ygJncYzjpYQc=;
 b=us5JKLX0XtmynC+jwvhHavFU1rVCd4GHIaXkzUCssQKZChP0v+kaUpoiRw94Hp+kXZ
 1OgoPP7gPDBTYA1Q+a2MKjXfuVZpeN3nZsYTV6/JE7iaeeFtOCgzx9OabuqnmPWZHe50
 vFhihnKLClDk3WZ91zA8D8HxK9JoTxq5LWFcCkQfFWMnIgqq3Di2AmtjbLT7WVsuX2Nk
 OOM+beEix/6kvadZdZU3d0QjSxyFnxuXorpPn1LKJk80JJXOXKnVkh/y4AJphak3wUvu
 oKXsUipZip2I2NlNuZLTpebySjrsoLfrIxwhDdxlCcW5tLNBreAUNFKRlx6tDpXzILeA
 eS6w==
X-Gm-Message-State: AOAM533sZbOYKEI4vdhdqON5ipXxhNs7JgIWrBOuawntfHQfiRyiOI++
 1Nh2kNjXbDGAAmTAraQxA0zQylTnoyXtVN8MDTZgaUbv/f+V/SLirs3NkqtkAU54rLrr7OCvLl/
 V81FxSHNrNerufBw=
X-Received: by 2002:adf:b1c4:: with SMTP id r4mr33275272wra.428.1634054221334; 
 Tue, 12 Oct 2021 08:57:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKtZqAGvjoTqweaMO4up37AZSKPmBhB1LxQUp45b/eTMa755Y4v9bLQ0QcNpovDHc8uCXeeA==
X-Received: by 2002:adf:b1c4:: with SMTP id r4mr33275224wra.428.1634054220964; 
 Tue, 12 Oct 2021 08:57:00 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id k17sm3348993wmj.0.2021.10.12.08.56.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 08:57:00 -0700 (PDT)
Message-ID: <f1b4ddcf-7b0c-eada-1132-da1b0cbe99b0@redhat.com>
Date: Tue, 12 Oct 2021 17:56:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 12/17] python/machine: Handle QMP errors on close more
 meticulously
To: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <20210923004938.3999963-1-jsnow@redhat.com>
 <20210923004938.3999963-13-jsnow@redhat.com>
 <CAFn=p-YwL+v7_rvC40z_T3DiKhH0cdgu53KTghwTjmixakHC+Q@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-YwL+v7_rvC40z_T3DiKhH0cdgu53KTghwTjmixakHC+Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.452,
 DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.10.21 18:52, John Snow wrote:
>
>
> On Wed, Sep 22, 2021 at 8:50 PM John Snow <jsnow@redhat.com> wrote:
>
>     To use the AQMP backend, Machine just needs to be a little more
>     diligent
>     about what happens when closing a QMP connection. The operation is no
>     longer a freebie in the async world; it may return errors
>     encountered in
>     the async bottom half on incoming message receipt, etc.
>
>     (AQMP's disconnect, ultimately, serves as the quiescence point
>     where all
>     async contexts are gathered together, and any final errors reported at
>     that point.)
>
>     Because async QMP continues to check for messages asynchronously, it's
>     almost certainly likely that the loop will have exited due to EOF
>     after
>     issuing the last 'quit' command. That error will ultimately be bubbled
>     up when attempting to close the QMP connection. The manager class here
>     then is free to discard it -- if it was expected.
>
>     Signed-off-by: John Snow <jsnow@redhat.com>
>
>     ---
>
>     Yes, I regret that this class has become quite a dumping ground for
>     complexity around the exit path. It's in need of a refactor to help
>     separate out the exception handling and cleanup mechanisms from the
>     VM-related stuff, but it's not a priority to do that just yet -- but
>     it's on the list.
>
>     Signed-off-by: John Snow <jsnow@redhat.com>
>     ---
>      python/qemu/machine/machine.py | 48
>     +++++++++++++++++++++++++++++-----
>      1 file changed, 42 insertions(+), 6 deletions(-)
>
>     diff --git a/python/qemu/machine/machine.py
>     b/python/qemu/machine/machine.py
>     index 0bd40bc2f76..c33a78a2d9f 100644
>     --- a/python/qemu/machine/machine.py
>     +++ b/python/qemu/machine/machine.py
>     @@ -342,9 +342,15 @@ def _post_shutdown(self) -> None:
>              # Comprehensive reset for the failed launch case:
>              self._early_cleanup()
>
>     -        if self._qmp_connection:
>     -            self._qmp.close()
>     -            self._qmp_connection = None
>     +        try:
>     +            self._close_qmp_connection()
>     +        except Exception as err:  # pylint: disable=broad-except
>     +            LOG.warning(
>     +                "Exception closing QMP connection: %s",
>     +                str(err) if str(err) else type(err).__name__
>     +            )
>     +        finally:
>     +            assert self._qmp_connection is None
>
>              self._close_qemu_log_file()
>
>     @@ -420,6 +426,31 @@ def _launch(self) -> None:
>                                             close_fds=False)
>              self._post_launch()
>
>     +    def _close_qmp_connection(self) -> None:
>     +        """
>     +        Close the underlying QMP connection, if any.
>     +
>     +        Dutifully report errors that occurred while closing, but
>     assume
>     +        that any error encountered indicates an abnormal termination
>     +        process and not a failure to close.
>     +        """
>     +        if self._qmp_connection is None:
>     +            return
>     +
>     +        try:
>     +            self._qmp.close()
>     +        except EOFError:
>     +            # EOF can occur as an Exception here when using the Async
>     +            # QMP backend. It indicates that the server closed the
>     +            # stream. If we successfully issued 'quit' at any point,
>     +            # then this was expected. If the remote went away without
>     +            # our permission, it's worth reporting that as an
>     abnormal
>     +            # shutdown case.
>     +            if not self._quit_issued:
>
>
> I strongly suspect that this line needs to actually be "if not 
> (self._user_killed or self._quit_issued):" to also handle the 
> force-kill cases.

Sounds right.

(Other than that, the patch looks good to me.)

> I wrote a different sync compatibility layer in a yet-to-be-published 
> branch and noticed this code still allows EOFError through. Why it did 
> not seem to come up in *this* series I still don't know -- I think the 
> timing of when exactly the coroutines get scheduled can be finnicky 
> depending on what else is running. So, sometimes, we manage to close 
> the loop before we get EOF and sometimes we don't.
>
> I am mulling over adding a "tolerate_eof: bool = False" argument to 
> disconnect() to allow the caller to handle this stuff with a little 
> less boilerplate. Anyone have strong feelings on that?

FWIW I don’t.

> (Ultimately, because there's no canonical "goodbye" in-band message, 
> the QMP layer itself can never really know if EOF was expected or not 
> -- that's really up to whomever is managing the connection, but it 
> does add a layer of complexity around the exit path that I am starting 
> to find is a nuisance. Not to mention that there are likely many 
> possible cases in which we might expect the remote to disappear on us 
> that don't involve using QMP at all -- kill is one, using the guest 
> agent to coerce the guest into shutdown is another. Networking and 
> migration are other theoretical(?) avenues for intended disconnects.)

For the iotests we don’t have a guest, so I suppose this doesn’t concern 
me, does it? :)

Hanna


