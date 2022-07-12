Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C61571A39
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:44:03 +0200 (CEST)
Received: from localhost ([::1]:49066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFFC-0006Pg-Sy
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBF9N-0007oo-8m
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:38:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBF9J-0006Ed-Q8
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657629476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybBwjFecaknMJp6X9yPX8/vY33NVpn7CcZBgB4haJ1E=;
 b=GNgu17bm6+PI8IkMpQdCU+Is8JM/jaQ0dGSqEixQt7eYADYiyI6QljGXuZJZt9Q0O4KsDP
 VKrA+DHb+VrOauNR0zfvFo3xvlFWTUd+47cf2HnVG3YXL4QY/o+6IuO/5cSpu6Z8tJMrko
 //luUqMZF9y2F8iEe69emwsA/au29eg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-xv5MC0frOumu21MRdwL_8w-1; Tue, 12 Jul 2022 08:37:55 -0400
X-MC-Unique: xv5MC0frOumu21MRdwL_8w-1
Received: by mail-ed1-f71.google.com with SMTP id
 o13-20020a056402438d00b0043aa846b2d2so6070879edc.8
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ybBwjFecaknMJp6X9yPX8/vY33NVpn7CcZBgB4haJ1E=;
 b=JldMGJwtA/b6rto3ZRzYSVtB1hyai7gRN+VNO+H/9VST8zRDzPSzNHtXQC09CLq/Un
 CV9eIxjeFhKA6W0J9r5ZQNFJiF3OsSLmVZVG9RgPp5HVNV0ypJKh5Ty0VfL0OkGdZ5ab
 iv3kUcOezv4LKUeXn5/ePxrzCqppDEc1AzmHbedMyIk6t/nP+gKUko6W9ee0VnK7Y0Hq
 O37WnIXF8LOgxDkosZF2SHggkwooV99R+ds5lI9J9emySzH0e8PI/Psk7RFZwN1Bywo9
 7/eabs23Akm0rAWnvTmA7uu9cN2v/PhBWd4EoVseprIawYnhtjG0ujgXZOCU+zZypkvc
 Y+Xw==
X-Gm-Message-State: AJIora8nO0LgnHQSKi6xIqoycVX8o8nXRUZXKNWWBwhr/CBtrFh8Fyd6
 Kr0pEzZ1eEWZOVOAIdHg5uyKnyQ1pOGLZM2nuljdy6k/apWt28wgIkPdndqTu27+0HzORwipnoy
 8dGP2/vWbQCc83WY=
X-Received: by 2002:a17:906:9b8a:b0:722:e50e:2a6d with SMTP id
 dd10-20020a1709069b8a00b00722e50e2a6dmr24306408ejc.724.1657629474618; 
 Tue, 12 Jul 2022 05:37:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sTTPzofRPgEEzRM/gq8lV2Gp/NBLGlqMIOQtPHa0IW38GLJy7XmRVz540FriS1crrQQxUXNA==
X-Received: by 2002:a17:906:9b8a:b0:722:e50e:2a6d with SMTP id
 dd10-20020a1709069b8a00b00722e50e2a6dmr24306390ejc.724.1657629474377; 
 Tue, 12 Jul 2022 05:37:54 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 26-20020a170906329a00b0072b4da1ed9asm2574602ejw.225.2022.07.12.05.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 05:37:53 -0700 (PDT)
Message-ID: <044695c5-c030-0cb9-9880-45e9e3ff2c29@redhat.com>
Date: Tue, 12 Jul 2022 14:37:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/3] qemu/qsd: Unlink absolute PID file path
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>
References: <20220609122701.17172-1-hreitz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220609122701.17172-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.06.22 14:26, Hanna Reitz wrote:
> Hi,
>
> QEMU (the system emulator) and the storage daemon (QSD) write their PID
> to the given file when you specify --pidfile.  They keep the path around
> and register exit handlers (QEMU uses an exit notifier, QSD an atexit()
> function) to unlink this file when the process terminates.  These
> handlers unlink precisely the path that the user has specified via
> --pidfile, so if it was a relative path and the process has at any point
> changed its working directory, the path no longer points to the PID
> file, and so the unlink() will fail (or worse).
>
> When using --daemonize, the process will always change its working
> directory to /, so this problem basically always appears when using
> --daemonize and --pidfile in conjunction.

[...]

> We can fix the problem by running realpath() once the PID file has been
> created, so we get an absolute path that we can unlink in the exit
> handler.  This is done here.

Thanks for the review, Dan, I’ve applied the series to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block


