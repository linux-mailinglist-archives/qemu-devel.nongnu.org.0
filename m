Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB02E3C9F0F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 15:03:15 +0200 (CEST)
Received: from localhost ([::1]:52190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m411G-0004DN-Df
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 09:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m40zn-0003S1-Pv
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 09:01:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m40zk-0000wb-Ow
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 09:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626354099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e4AI0TOsirM/eb78KoVDjbpYO+uPGFUhmllayQkEhqY=;
 b=WtTZAgAEGbl0vQdjnC0wAs0iiO8eeDv2cV5ktyUYfn3aKHLIQDeqE4Gkw6d3BpUTmAFMso
 16TVdEf4mFgzerTZk9KgXtPBk5j2QdsRzHUoTK1sG6LeBpa+EGRdszZ2xCYyhMC7HDDR0r
 /K0YiuM+wdGzZIceG39lZTKsCx8mP1M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-t7mEhJ5PPeK9TxcdYxvCIg-1; Thu, 15 Jul 2021 09:01:38 -0400
X-MC-Unique: t7mEhJ5PPeK9TxcdYxvCIg-1
Received: by mail-wr1-f71.google.com with SMTP id
 k3-20020a5d52430000b0290138092aea94so3311121wrc.20
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 06:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=e4AI0TOsirM/eb78KoVDjbpYO+uPGFUhmllayQkEhqY=;
 b=fx9TGpGwgon+xXXdVMu9CNfA2COb41MSwE2TI5HihTgU9SmWck10ENo3uYfOtWwIDQ
 kCjWQ+KSrRuSkTsnVHlt+sJkVoC2VoLIwli34SLQ1QMRwvz5y1IVlaIlCFX25Vde7MGb
 ukpQiaCsWWYPIzJ5Ef+kHP027g3vtANv7T2HEmWruC0jy0oQngb7fwcaFRZdUHCT8mEk
 Bmx+jGR280TNKD0SkObDElg4xSWsdPjICld98TdTUWj8KKWmvgWTqM24MF9pWGa0MUj8
 +NV/hOX7cuyEziG5mA5Or0O75W8yH9BQ3mUFk/JMJBO/TZcP3xV+r6+VXSScpeCwHblF
 1+rA==
X-Gm-Message-State: AOAM533VPDjq2h5XcEQG921ys0UhuWAJOciGrxZRqWxgZ7/eE5ycjvlm
 TGfOeOPA+Z0w1FtyPf81OCnw/A3MYmtxou9fQN/jdznFEUsmn56voAesJJcApByrcVbwAvZaPbA
 3AbNAQkDLqPwte+eOUNhZ2aZ+FcwY8VruxFpACwbGmvrGU2IEZrWqVmAYGh3DJekQ
X-Received: by 2002:a05:6000:108:: with SMTP id
 o8mr5573065wrx.154.1626354097219; 
 Thu, 15 Jul 2021 06:01:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylFRKxbWhwWvkqeuUysgzYNk+cvEZyrEyQ+vz4zpSDWemTp/TmXL2gYa3cghfaNnvGwRdXAA==
X-Received: by 2002:a05:6000:108:: with SMTP id
 o8mr5573022wrx.154.1626354096944; 
 Thu, 15 Jul 2021 06:01:36 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 p7sm2445144wmq.5.2021.07.15.06.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 06:01:36 -0700 (PDT)
Subject: Re: [PATCH v8 09/16] docs/devel/testing: add -gdb option to the
 debugging section of QEMU iotests
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210705065711.127119-1-eesposit@redhat.com>
 <20210705065711.127119-10-eesposit@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <5ef83b3b-1614-6471-b21b-c3651bd6c53b@redhat.com>
Date: Thu, 15 Jul 2021 15:01:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705065711.127119-10-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.07.21 08:57, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   docs/devel/testing.rst | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 9d6a8f8636..8b24e6fb47 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -229,6 +229,17 @@ Debugging a test case
>   The following options to the ``check`` script can be useful when debugging
>   a failing test:
>   
> +* ``-gdb`` wraps every QEMU invocation in a ``gdbserver``, which waits for a
> +  connection from a gdb client.  The options given to ``gdbserver`` (e.g. the
> +  address on which to listen for connections) are taken from the ``$GDB_OPTIONS``
> +  environment variable.  By default (if ``$GDB_OPTIONS`` is empty), it listens on
> +  ``localhost:12345``.
> +  It is possible to connect to it for example with
> +  ``gdb -iex "target remote $addr"``, where ``$addr`` is the address
> +  ``gdbserver`` listens on.
> +  If the ``-gdb`` option is not used, ``$GDB_OPTIONS`` is ignored,
> +  regardless on whether it is set or not.

s/on/of/

With that: Reviewed-by: Max Reitz <mreitz@redhat.com>


