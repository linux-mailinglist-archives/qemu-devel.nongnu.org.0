Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B6D4773A0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:52:41 +0100 (CET)
Received: from localhost ([::1]:55784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxrBY-0008Uo-7f
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:52:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxr8f-0005kM-RV
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:49:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxr8d-0001W5-8Q
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:49:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639662567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2GTBRgjoZd63VM4FqXxnZc4xegXLkjbIHxRbBl1Hdus=;
 b=B9gMjetWZMGwiRL3pY/51qD13Ui/jZcn/Jjm+B1tpihOzWBycaeWzeqRvrrIdG0oD47FHM
 GkRFh01vgwp83yXpvkHfg6rl451+N9mMbQGh9sr/UIkxX62Z/rD1HKDDWMfuk4IZRLElu9
 5xpjRB6vhackJgUx6A2rTq2u38Fycd0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-8Ij8Idh8NauGZ-v1FDHNhA-1; Thu, 16 Dec 2021 08:49:26 -0500
X-MC-Unique: 8Ij8Idh8NauGZ-v1FDHNhA-1
Received: by mail-qt1-f199.google.com with SMTP id
 p7-20020ac84087000000b002b60be80b27so33525722qtl.18
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:49:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2GTBRgjoZd63VM4FqXxnZc4xegXLkjbIHxRbBl1Hdus=;
 b=KtOatGrcK5lTpuLdvWdhtFrh++Ormo4VcAhZUXaGLP7pKQsXglfM1YxEdQ4HnsqD1I
 h9cfiYc4BE0OQAX03a2vd847Q2wQzKAryszJmnykyPPNkZJwEnswIrnPtAYL9EoM83vb
 2h87evAW+QvC7Cf1AocaRY0x6q98jmemKfVk7plon/g0SrZJvNCo1WiRxFkidXUrvUpH
 rgTv3PDj/Jzu6ZJTUS1MiKe6BcULFP8TLstFvfRtbFM06XcqukT6ejwP37NGgHDaR7k1
 hkbiIQa2I8nfD+nwI+rZr9bnmt+sFhhV8m1cOY/vjbIdELr6bECUHZHRDmAWIM+eVUe1
 JpfA==
X-Gm-Message-State: AOAM532mJSuuxPXZHcFmN6KAmCyxuSe1B42wv3WqIChQgEUMAaKqle6b
 vD7rK4TyqqSylIk/O0U2fSeoaOyuE65zONmuI/Zo9JvgcZqb45H3mbPPWu1gwPDY0om4vh/hB2O
 6UC5wBUyOqTAVJg8=
X-Received: by 2002:a05:6214:29c3:: with SMTP id
 gh3mr16196468qvb.30.1639662566021; 
 Thu, 16 Dec 2021 05:49:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeWTJeSNULKLFrXymu9LoJSs13Ocx+BRVJoQSTcc3nOOkIJrsdQ3/0aZP8SQn69rq2/htLRw==
X-Received: by 2002:a05:6214:29c3:: with SMTP id
 gh3mr16196299qvb.30.1639662563934; 
 Thu, 16 Dec 2021 05:49:23 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id i11sm2709397qko.116.2021.12.16.05.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:49:23 -0800 (PST)
Date: Thu, 16 Dec 2021 10:49:21 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 16/25] scripts/bench-block-job: switch to AQMP
Message-ID: <20211216134921.gkyaxm6kbby2sioj@laptop.redhat>
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-17-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215193939.3768033-17-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Wainer Moschetta <wainersm@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 02:39:30PM -0500, John Snow wrote:
> For this commit, we only need to remove accommodations for the
> synchronous QMP library.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/simplebench/bench_block_job.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
> index a403c35b08..af9d1646a4 100755
> --- a/scripts/simplebench/bench_block_job.py
> +++ b/scripts/simplebench/bench_block_job.py
> @@ -27,7 +27,6 @@
>  
>  sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
>  from qemu.machine import QEMUMachine
> -from qemu.qmp import QMPConnectError
>  from qemu.aqmp import ConnectError
>  
>  
> @@ -50,7 +49,7 @@ def bench_block_job(cmd, cmd_args, qemu_args):
>          vm.launch()
>      except OSError as e:
>          return {'error': 'popen failed: ' + str(e)}
> -    except (QMPConnectError, ConnectError, socket.timeout):
> +    except (ConnectError, socket.timeout):
>          return {'error': 'qemu failed: ' + str(vm.get_log())}
>  
>      try:

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


