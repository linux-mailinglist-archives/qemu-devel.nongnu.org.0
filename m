Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93844208DE
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:58:44 +0200 (CEST)
Received: from localhost ([::1]:60506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKk7-0004DG-Ra
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXKVs-000852-1y
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:44:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXKVq-0005aT-3w
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633340636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0w39iwZL8gvicgyPooaD5FpALkAwpdEE4DsuepooYI8=;
 b=XZ9tkyxVSoK2bVNJKblETrQn+CaM+OMDeZJyN2Jk3pJ5ynymtlg66oY+juyhPs+4sBstwd
 4TTU1Xp+baqm6+aBRM57xerR43LdGHV9L9uUAOrnJi110IChs297gkZqS2Q2OU7c9DSbeD
 nFh90jdZMqt6LfuYnQSYLTyP98tbDEE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-5dz0IwL9OLeUsZhEtLThQg-1; Mon, 04 Oct 2021 05:43:55 -0400
X-MC-Unique: 5dz0IwL9OLeUsZhEtLThQg-1
Received: by mail-wm1-f72.google.com with SMTP id
 129-20020a1c1987000000b0030cd1616fbfso9726336wmz.3
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 02:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0w39iwZL8gvicgyPooaD5FpALkAwpdEE4DsuepooYI8=;
 b=W5xH/tlnELiJrfJJROEyWrE39CIck1AYzRK3HCU2W1rbl+XIB4YlxkZo50MWh0paEL
 c+HPXzT/P3ZPlkEzwKKdG74ybKSMBXF81l+m7ILVG/SFSOpmg85Op4UxoZNGr/hCFVSD
 68WfYjLuTIrhKkY/nUdhfJC1I+67/RHoEpGQ+mu9u+7PDpD/RRkUQFV63bq3E5ahgyz3
 FFAlXL+aF6tOk6e9kQW2X6WJ+6+dVuxY9HutSWFPliaNYTYlEb6CrQm3F1RV1eIP866l
 VqaWSDfeQqZc5zi6K9mk2zSY5UAqpmKbg5LkhRjfGokvXJPlfq/ijxZYiP4mc1zciTOk
 W/iw==
X-Gm-Message-State: AOAM532ZE8b0kw3net+V4p4QTbg+9FXRfql/efhVywPvlWD3unWsCWWX
 Gppu52SBXOPnDVwzA4ZnOfT8XQZLt6xcuy3WG484aOPpdyBOZ7VI5j8j0ehPzLGwmUVNMviydKI
 VPhu+mOXptmf9Pe4=
X-Received: by 2002:a5d:64cd:: with SMTP id f13mr12864239wri.419.1633340634232; 
 Mon, 04 Oct 2021 02:43:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2toZeFchBC5qKp08MtJRtNypaWbeyJUVEMyu8wR7I9yJlYdOyd8qHTMNjXS2cZxvIADy/qQ==
X-Received: by 2002:a5d:64cd:: with SMTP id f13mr12864224wri.419.1633340633976; 
 Mon, 04 Oct 2021 02:43:53 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id z17sm13937428wrr.49.2021.10.04.02.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 02:43:53 -0700 (PDT)
Subject: Re: [PATCH 10/15] python/machine: Add support for AQMP backend
To: John Snow <jsnow@redhat.com>
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-11-jsnow@redhat.com>
 <4c307fd7-850f-908e-0a51-d5a5bb99a04f@redhat.com>
 <CAFn=p-apQ9GkJhfuJRNeyAvzqS9snz=g3T9Lkh_=_oEh+XEtUA@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <32707468-2abe-d0af-2ff5-261bfdba2dcc@redhat.com>
Date: Mon, 4 Oct 2021 11:43:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFn=p-apQ9GkJhfuJRNeyAvzqS9snz=g3T9Lkh_=_oEh+XEtUA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.09.21 01:48, John Snow wrote:
>
>
> On Fri, Sep 17, 2021 at 10:16 AM Hanna Reitz <hreitz@redhat.com 
> <mailto:hreitz@redhat.com>> wrote:
>
>     On 17.09.21 07:40, John Snow wrote:
>     > To use the AQMP backend, Machine just needs to be a little more
>     diligent
>     > about what happens when closing a QMP connection. The operation
>     is no
>     > longer a freebie in the async world.
>     >
>     > Because async QMP continues to check for messages
>     asynchronously, it's
>     > almost certainly likely that the loop will have exited due to
>     EOF after
>     > issuing the last 'quit' command. That error will ultimately be
>     bubbled
>     > up when attempting to close the QMP connection. The manager
>     class here
>     > then is free to discard it if it was expected.
>     >
>     > Signed-off-by: John Snow <jsnow@redhat.com
>     <mailto:jsnow@redhat.com>>
>     >
>     > ---
>     >
>     > Yes, I regret that this class has become quite a dumping ground for
>     > complexity around the exit path. It's in need of a refactor to help
>     > separate out the exception handling and cleanup mechanisms from the
>     > VM-related stuff, but it's not a priority to do that just yet -- but
>     > it's on the list.
>     >
>     > ---
>     >   python/qemu/machine/machine.py | 51
>     ++++++++++++++++++++++++++++++----
>     >   1 file changed, 46 insertions(+), 5 deletions(-)
>     >
>     > diff --git a/python/qemu/machine/machine.py
>     b/python/qemu/machine/machine.py
>     > index 6e58d2f951..8f5a6649e5 100644
>     > --- a/python/qemu/machine/machine.py
>     > +++ b/python/qemu/machine/machine.py
>     > @@ -342,9 +342,15 @@ def _post_shutdown(self) -> None:
>     >           # Comprehensive reset for the failed launch case:
>     >           self._early_cleanup()
>     >
>     > -        if self._qmp_connection:
>     > -            self._qmp.close()
>     > -            self._qmp_connection = None
>     > +        try:
>     > +            self._close_qmp_connection()
>     > +        except Exception as err:  # pylint: disable=broad-except
>     > +            LOG.warning(
>     > +                "Exception closing QMP connection: %s",
>     > +                str(err) if str(err) else type(err).__name__
>     > +            )
>     > +        finally:
>     > +            assert self._qmp_connection is None
>     >
>     >           self._close_qemu_log_file()
>     >
>     > @@ -420,6 +426,31 @@ def _launch(self) -> None:
>     > close_fds=False)
>     >           self._post_launch()
>     >
>     > +    def _close_qmp_connection(self) -> None:
>     > +        """
>     > +        Close the underlying QMP connection, if any.
>     > +
>     > +        Dutifully report errors that occurred while closing,
>     but assume
>     > +        that any error encountered indicates an abnormal
>     termination
>     > +        process and not a failure to close.
>     > +        """
>     > +        if self._qmp_connection is None:
>     > +            return
>     > +
>     > +        try:
>     > +            self._qmp.close()
>     > +        except EOFError:
>     > +            # EOF can occur as an Exception here when using the
>     Async
>     > +            # QMP backend. It indicates that the server closed the
>     > +            # stream. If we successfully issued 'quit' at any
>     point,
>     > +            # then this was expected. If the remote went away
>     without
>     > +            # our permission, it's worth reporting that as an
>     abnormal
>     > +            # shutdown case.
>     > +            if not self._has_quit:
>     > +                raise
>     > +        finally:
>     > +            self._qmp_connection = None
>     > +
>     >       def _early_cleanup(self) -> None:
>     >           """
>     >           Perform any cleanup that needs to happen before the VM
>     exits.
>     > @@ -461,8 +492,18 @@ def _soft_shutdown(self, timeout:
>     Optional[int]) -> None:
>     >
>     >           if self._qmp_connection:
>     >               if not self._has_quit:
>     > -                # Might raise ConnectionReset
>     > -                self.qmp('quit')
>     > +                try:
>     > +                    # May raise ExecInterruptedError or
>     StateError if the
>     > +                    # connection dies or has already died.
>     > +                    self.qmp('quit')
>     > +                finally:
>     > +                    # If 'quit' fails, we'll still want to call
>     close(),
>     > +                    # which will raise any final errors that
>     may have
>     > +                    # occurred while trying to send 'quit'.
>     > +                    self._close_qmp_connection()
>     > +            else:
>     > +                # Regardless, we want to tidy up the socket.
>     > +                self._close_qmp_connection()
>
>     Why can’t we wait for _post_shutdown to do that?  Has it something
>     to do
>     with this operation being “no longer a freeby” (I’m not quite sure
>     what
>     this refers to, execution time, or the set of possible exceptions, or
>     perhaps something else entirely), and so we want to do it in the
>     already-not-instantaneous _soft_shutdown?
>
>     Hanna
>
>
> I wrote that commit message too casually.
>
> By "freebie", I meant that closing a simple sync socket does not have 
> any potential for raising an error, so we don't really have to worry 
> about that operation failing. The async machinery, by comparison, uses 
> the disconnection point as its synchronization point where it gathers 
> the final results from its various execution contexts (the reader, 
> writer, and disconnection tasks).
>
> The likeliest error to see here would be something like EOFError for 
> QEMU hanging up before disconnect() was called. Other possible errors 
> would be stuff from deep in the internals of AQMP that very likely 
> means there's a bug I need to resolve -- so I was afraid of just 
> wholesale silencing such things. (Hence the logged warning in the 
> _post_shutdown method. I genuinely don't expect to see anything there, 
> but I am paranoid and wanted to be rock-solid sure that any problems 
> are visible.) It is also possible that if QEMU were to send a garbled 
> and unprompted message after 'quit' succeeded (For example, a 
> malformed SHUTDOWN event) that this would also enqueue an error to be 
> shown here at this point.
>
> One of the design points of AQMP is that calling 
> QMPClient.disconnect() is necessary to reset the client to a fully 
> IDLE state to where it can be re-used for a subsequent connection. It 
> serves double-duty as both disconnect *and* results gathering. So I 
> wanted to make sure to call it here while we still had the opportunity 
> to report an "Abnormal Shutdown" instead of potentially choking later 
> during the post-shutdown and failing to do resource cleanup.
>
> Good: if shutdown() succeeds, you can rest well knowing that 
> definitely nothing weird happened.
> Bad: There's a lot of complexity inherent in promising that.
>
> Clear as mud?

Yep, that makes sense.  Thanks!

(Seems like you intend to send a v2, so I think I’ll refrain from giving 
a rather haphazard R-b now, because two weeks later I forgot whether I 
was originally confident enough to give one were it now for that bit 
here...)

Hanna


