Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A581540FA14
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:18:21 +0200 (CEST)
Received: from localhost ([::1]:41694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mREh2-0005AE-GP
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mREez-0004Ic-Aq
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:16:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mREev-0005yM-HG
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631888168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fA1/6xH08cX/hVsiKD6odNXisZuM4JQZhI4mhkhK34s=;
 b=UP/6Fd87pSvr0hzF2ny5d2DORGs05paAusdK41wox+k+8xWfaEnTYtEEQxO1ezyCm9dOyq
 9rtdYfdl//ZHNtsng8Es9yMZbKBDBter0/Cu3XUmCeQ5S33+X3YfjBnNnmA9NeMB51ORui
 YMl6uqYCMEfbegeNa8O16p163JmU9w0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-b-wPefZtM4WpefApp-9gmg-1; Fri, 17 Sep 2021 10:16:06 -0400
X-MC-Unique: b-wPefZtM4WpefApp-9gmg-1
Received: by mail-wm1-f70.google.com with SMTP id
 g18-20020a1c4e12000000b002fa970d2d8dso1793620wmh.0
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 07:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=fA1/6xH08cX/hVsiKD6odNXisZuM4JQZhI4mhkhK34s=;
 b=zdITUEtjhq/7O8iKeyhTESKo0f/ET1DeR4U5YdrYxPorOCiIrTUfGNdYb1x3NM+6jq
 CXtkhLyXFbMixxCnrqNignuxVJMHC285mUnwWb7IohN6jiv1Yaz3krufJjB5CuRBYhv8
 3lHG5tTkcJeNTqiXktRXaR76bKm2H+RBUtLY02skPRcDsF4LCA04U1D1tADo4Tosk9Zz
 G7pxb8xa0ZPuSn6cLF16L6TpCi7k50yMcZU8zAIOtvFhOqd2COAAXObUiUx5QkYIklrE
 tVetPtGLKSk1Ei+LxDpXpv8zwNCvkYjv5sBMQhfYjOhGc7ghR2UQUjk8OwGHbqbKcXWt
 ZNHw==
X-Gm-Message-State: AOAM530e+0nY61NqBmHKaCw1Kp9/zqI99J03lLEREdJT2Sql1KEbRlbK
 2lUBv4siiapMlbTierPd48+XD6o4lGTIpY2VjlE7+2m5QOMubQAHL+ZaGAvEiPkHsohC0dcRVPv
 FZ83jmPONTV/55W8=
X-Received: by 2002:a5d:444a:: with SMTP id x10mr12397031wrr.360.1631888165703; 
 Fri, 17 Sep 2021 07:16:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymM4VJP+a6arJYCBTTUb/u6tCs/7civdguRgBfhGZwEJwV0zdfsCBxOlYg0ln/XT+LN+APsQ==
X-Received: by 2002:a5d:444a:: with SMTP id x10mr12397005wrr.360.1631888165485; 
 Fri, 17 Sep 2021 07:16:05 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id a6sm10916545wmb.7.2021.09.17.07.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 07:16:05 -0700 (PDT)
Subject: Re: [PATCH 10/15] python/machine: Add support for AQMP backend
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-11-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <4c307fd7-850f-908e-0a51-d5a5bb99a04f@redhat.com>
Date: Fri, 17 Sep 2021 16:16:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917054047.2042843-11-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.09.21 07:40, John Snow wrote:
> To use the AQMP backend, Machine just needs to be a little more diligent
> about what happens when closing a QMP connection. The operation is no
> longer a freebie in the async world.
>
> Because async QMP continues to check for messages asynchronously, it's
> almost certainly likely that the loop will have exited due to EOF after
> issuing the last 'quit' command. That error will ultimately be bubbled
> up when attempting to close the QMP connection. The manager class here
> then is free to discard it if it was expected.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> Yes, I regret that this class has become quite a dumping ground for
> complexity around the exit path. It's in need of a refactor to help
> separate out the exception handling and cleanup mechanisms from the
> VM-related stuff, but it's not a priority to do that just yet -- but
> it's on the list.
>
> ---
>   python/qemu/machine/machine.py | 51 ++++++++++++++++++++++++++++++----
>   1 file changed, 46 insertions(+), 5 deletions(-)
>
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index 6e58d2f951..8f5a6649e5 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -342,9 +342,15 @@ def _post_shutdown(self) -> None:
>           # Comprehensive reset for the failed launch case:
>           self._early_cleanup()
>   
> -        if self._qmp_connection:
> -            self._qmp.close()
> -            self._qmp_connection = None
> +        try:
> +            self._close_qmp_connection()
> +        except Exception as err:  # pylint: disable=broad-except
> +            LOG.warning(
> +                "Exception closing QMP connection: %s",
> +                str(err) if str(err) else type(err).__name__
> +            )
> +        finally:
> +            assert self._qmp_connection is None
>   
>           self._close_qemu_log_file()
>   
> @@ -420,6 +426,31 @@ def _launch(self) -> None:
>                                          close_fds=False)
>           self._post_launch()
>   
> +    def _close_qmp_connection(self) -> None:
> +        """
> +        Close the underlying QMP connection, if any.
> +
> +        Dutifully report errors that occurred while closing, but assume
> +        that any error encountered indicates an abnormal termination
> +        process and not a failure to close.
> +        """
> +        if self._qmp_connection is None:
> +            return
> +
> +        try:
> +            self._qmp.close()
> +        except EOFError:
> +            # EOF can occur as an Exception here when using the Async
> +            # QMP backend. It indicates that the server closed the
> +            # stream. If we successfully issued 'quit' at any point,
> +            # then this was expected. If the remote went away without
> +            # our permission, it's worth reporting that as an abnormal
> +            # shutdown case.
> +            if not self._has_quit:
> +                raise
> +        finally:
> +            self._qmp_connection = None
> +
>       def _early_cleanup(self) -> None:
>           """
>           Perform any cleanup that needs to happen before the VM exits.
> @@ -461,8 +492,18 @@ def _soft_shutdown(self, timeout: Optional[int]) -> None:
>   
>           if self._qmp_connection:
>               if not self._has_quit:
> -                # Might raise ConnectionReset
> -                self.qmp('quit')
> +                try:
> +                    # May raise ExecInterruptedError or StateError if the
> +                    # connection dies or has already died.
> +                    self.qmp('quit')
> +                finally:
> +                    # If 'quit' fails, we'll still want to call close(),
> +                    # which will raise any final errors that may have
> +                    # occurred while trying to send 'quit'.
> +                    self._close_qmp_connection()
> +            else:
> +                # Regardless, we want to tidy up the socket.
> +                self._close_qmp_connection()

Why can’t we wait for _post_shutdown to do that?  Has it something to do 
with this operation being “no longer a freeby” (I’m not quite sure what 
this refers to, execution time, or the set of possible exceptions, or 
perhaps something else entirely), and so we want to do it in the 
already-not-instantaneous _soft_shutdown?

Hanna

>   
>           # May raise subprocess.TimeoutExpired
>           self._subp.wait(timeout=timeout)


