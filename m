Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE5A4E4042
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 15:11:16 +0100 (CET)
Received: from localhost ([::1]:45742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWfEB-0000XJ-II
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 10:11:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWfB6-00077m-SA
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:08:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWfB4-0002mL-NS
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647958081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3tcO+wUQQNagk7Ql2QqR0pn2ODq+VT0/M7pjmc6FMUo=;
 b=UgN4pTqqeeJ+NKRRjZmXnPDnYrbUuusUqHDWQ/+pnelA7bqL98U/+5UDg9D+GOzEI8SC3Z
 JTnHgZmqFhIVBbadZoYrEzyg8HFqHoDpNufu6BlENKgQO2aMfiJ2x54G8MPIkkFysgo3Mw
 JmNy0Vi0SS0myUMpaymhSUJed5wq6j4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-DWmLcu6ONOOFMgEb74PhDQ-1; Tue, 22 Mar 2022 10:08:00 -0400
X-MC-Unique: DWmLcu6ONOOFMgEb74PhDQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 b24-20020a50e798000000b0041631767675so10621904edn.23
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 07:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3tcO+wUQQNagk7Ql2QqR0pn2ODq+VT0/M7pjmc6FMUo=;
 b=m7H70I3WSvCJrZIbI1HVhPJG1lJQUawzyWrhlNd2A3kAlHVAzOWHYklwkhDD7RGflb
 59LBvTi0IvSC/22XkUjVxhpK3X5OQEv+yQJFof7CkqKXI+2beEv1DzwnT3hXkFkYXM52
 XvZ4VyTPFrv76vQTMN/WV8M07OjhN5JSXKHKaHoEzuLaWu972aPik14WAGEDW0wpr3eO
 z9GS4tJ0cSkb8FgXtsW4xtI+Kptn/W1ayBH3TfrH7tQkFomqTZASgF9EUtp45BbrbAEt
 JqCoGLYTb+zlFgg1agwVpsub707CHnvqMyjrzBow21QXV0HdLSwzBe2dk59HKVZTBv3q
 Cx/w==
X-Gm-Message-State: AOAM531x7MsdO6nZrupD2a57jm7lgN9LFJbPQ8gmLC5HjwaEkE0AOJkZ
 Ki7MHmnCq3bvy6otU9nwGKiqy04c+sN2wJR1oyhoCdHpAZdjwy9bcSsmuaqST2nFCNBrduAkdU5
 4UCOLnNg5cIgUWMo=
X-Received: by 2002:a17:906:39da:b0:6cf:7f09:a7bc with SMTP id
 i26-20020a17090639da00b006cf7f09a7bcmr27071945eje.457.1647958079457; 
 Tue, 22 Mar 2022 07:07:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzXvk+tvL13/gajduN7ZaP4ca/aVKQ10tiEGGvRJLy9L2syBMw89ZGTwQ/2Jma2z7KplxvrQ==
X-Received: by 2002:a17:906:39da:b0:6cf:7f09:a7bc with SMTP id
 i26-20020a17090639da00b006cf7f09a7bcmr27071862eje.457.1647958078750; 
 Tue, 22 Mar 2022 07:07:58 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a05640212c300b0041605b2d9c1sm9603041edx.58.2022.03.22.07.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 07:07:58 -0700 (PDT)
Message-ID: <c241f8ea-0b8c-4d9f-0441-842d98d3b36b@redhat.com>
Date: Tue, 22 Mar 2022 15:07:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/15] iotests/163: Fix broken qemu-io invocation
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-3-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220318203655.676907-3-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.22 21:36, John Snow wrote:
> The 'read' commands to qemu-io were malformed, and this invocation only
> worked by coincidence because the error messages were identical. Oops.
>
> There's no point in checking the patterning of the reference image, so
> just check the empty image by itself instead.
>
> (Note: as of this commit, nothing actually enforces that this command
> completes successfully, but a forthcoming commit in this series will
> enforce that qemu_io() must have a zero status code.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/163 | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/tests/qemu-iotests/163 b/tests/qemu-iotests/163
> index e4cd4b230f..c94ad16f4a 100755
> --- a/tests/qemu-iotests/163
> +++ b/tests/qemu-iotests/163
> @@ -113,10 +113,7 @@ class ShrinkBaseClass(iotests.QMPTestCase):
>           qemu_img('resize',  '-f', iotests.imgfmt, '--shrink', test_img,
>                    self.shrink_size)
>   
> -        self.assertEqual(
> -            qemu_io('-c', 'read -P 0x00 %s'%self.shrink_size, test_img),
> -            qemu_io('-c', 'read -P 0x00 %s'%self.shrink_size, check_img),
> -            "Verifying image content")
> +        qemu_io('-c', f"read -P 0x00 0 {self.shrink_size}", test_img)

I’m actually puzzled by the original intent here.  check_img doesn’t 
contain 0x00 in that area...

Well.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


