Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2397475D47
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:23:11 +0100 (CET)
Received: from localhost ([::1]:54450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxX3e-0007tC-UN
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:23:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxWcm-00039V-1j
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:55:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxWcj-0008L9-Hl
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:55:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639583719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Cn5bUCdbOyPN9Ffj5xXynBA2m5BnjJKBALLM/WFL0M=;
 b=LygNetg4L8A/rJBxH17e2OZgDOcjJ74ba372NED78YE+yH1yExDzHIjJBZev8xsqLyaIfD
 c/KtITEAzY8susQSxtKZ3PvUv5Kd5zWhbP40yYtBcChCkOu+z173/b9+Wzdmlt491MfW1R
 AlnD1reI6btZ3jMc9WxM1nDbCCh/V9Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-28k0PCDIPJOU5Nht_ve0Ow-1; Wed, 15 Dec 2021 10:54:29 -0500
X-MC-Unique: 28k0PCDIPJOU5Nht_ve0Ow-1
Received: by mail-wm1-f69.google.com with SMTP id
 b83-20020a1c1b56000000b0033283ea5facso13825wmb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 07:54:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0Cn5bUCdbOyPN9Ffj5xXynBA2m5BnjJKBALLM/WFL0M=;
 b=ixLoIBeOS8mannTU4O2cYohus6JMun5JxJ9reTdun7O1Ra2raw/zw+FJORFtkm84sZ
 GEmO1GpXzczFomatAw5Lmq7snsacdz/ZKHgsCGhUqd6d3AgqOimIQBNzjUgkMlRsW682
 xZfaJKDlZPmJD09WIy5d2bIt8e1FZEaMdhXUVXyQ6txKPP4W3TfTxs8UflkEyPkPU1ym
 hZF8Svw13R0GwuWs655LprbyWYDgEbYEXbTEIBLY5J9+PvaXLywv/0TRf9l2T3Nb9c0X
 vIaqQgSbjo2Gv1iSo2smSuEB1WrgBxSEJpITR3GLsv91wROnmuDJ2f5Xd1+nwjvJa3Pw
 9eVg==
X-Gm-Message-State: AOAM533QhGm9DaYBj849uYiYTOY3xXW7ZegUtBsJgVmlMx35+VpNJ8zg
 C3PpIWz+jAbKENj97509sVCp893skRCmM3tYYTEVLhz4qevxe9TXS5SCKPLmwbCF9PtaxbR5hKy
 wGKDp61Tc6FshZ/w=
X-Received: by 2002:adf:e54a:: with SMTP id z10mr5029509wrm.328.1639583668658; 
 Wed, 15 Dec 2021 07:54:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyg63fQgSxKLUB4mRRYAKvdF6hwUy4nL7hywjU/rARkLGZkf9d3zl+Er1q9wuYQSk4oMFkrVA==
X-Received: by 2002:adf:e54a:: with SMTP id z10mr5029475wrm.328.1639583668465; 
 Wed, 15 Dec 2021 07:54:28 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id 10sm1566066wmp.3.2021.12.15.07.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 07:54:28 -0800 (PST)
Message-ID: <99801855-fcd1-db07-c598-34532b1e48bc@redhat.com>
Date: Wed, 15 Dec 2021 16:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 02/14] tests/avocado: Specify target VM argument to
 helper routines
To: Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org
References: <cover.1639549843.git.jag.raman@oracle.com>
 <31a4b3bb6a48f291890641ab348e7749c70a2d06.1639549843.git.jag.raman@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <31a4b3bb6a48f291890641ab348e7749c70a2d06.1639549843.git.jag.raman@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 bleal@redhat.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 wainersm@redhat.com, alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 16:35, Jagannathan Raman wrote:
> Specify target VM for exec_command and
> exec_command_and_wait_for_pattern routines
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  tests/avocado/avocado_qemu/__init__.py | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


