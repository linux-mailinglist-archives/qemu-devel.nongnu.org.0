Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FAB48A1DA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:24:45 +0100 (CET)
Received: from localhost ([::1]:47532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n729k-00012p-JA
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:24:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n722X-0000Rz-PZ
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:17:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n722Q-0006KK-0g
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:17:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641849419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nW9PDhTBLX1TibjX8l75eFfWy6E2TrHL1pCZEtlUtEk=;
 b=KQQqIE0TIEwF3NQL152MmZ8c4Tqf36jctlx1XFFTE3DFh/OjYkSx6uzkby+ny29LNYG9rZ
 3lv8saGWG2A5SEarJ01XAfeEcS7iUBF1PQQ7S7K7KhNTdwh4QAk9D0QLZhuvnBSUgkdaQW
 eMtTecfVyV+Zavc5ePCenXCbG3ScJvo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-1Nrd4vj6MT2ciYaj_RC38g-1; Mon, 10 Jan 2022 16:16:58 -0500
X-MC-Unique: 1Nrd4vj6MT2ciYaj_RC38g-1
Received: by mail-qv1-f72.google.com with SMTP id
 f7-20020a056214076700b0041161d5b77bso14279707qvz.22
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 13:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nW9PDhTBLX1TibjX8l75eFfWy6E2TrHL1pCZEtlUtEk=;
 b=YOsrTav+HmP0nHVSzsCO9M1s3bGJTUci4jndPzu3wWTDcWzE8wJkzZS4eYL5d4+ba/
 XPY2J+tZsEI06KcbUIEkbGi6azAag0RbN1E1jijmDJK38Vsmbu+CYGXr9rV37kyKVIR/
 hDQQLsb2PHC2zxYtz99KqyN5wk2BEYv7hP+ln5RX847MqqtsV1XSZDIBh/vqcZY2dGDE
 /+PELJ/YILYc8M2FYX8WquxFUYdz4ftSASr/Kq1BY2XNuljp90G3QB2ZiH3SarLtEZnx
 lZpASPyLpnrucc7Q0oNzc0Mg3PQ2rWV9w/TJxciqYz0LOyJ3r6GoFSxxd1ofuYzL+Xbh
 IENQ==
X-Gm-Message-State: AOAM530xSZ2zwK6KB+Si7ij9u7o7HGbfGDYbmP/Lp5sBGp+h9D1b3uTV
 NQ3xVq/Xd2MWRWatchzbZ+7cVZjR/o2rJnsOexMNvA18kotbFhoumaFoAVnWrVzUjIH2vsaxNdB
 9+8zFHebPYEYCg/8=
X-Received: by 2002:ac8:59c9:: with SMTP id f9mr1405130qtf.204.1641849418105; 
 Mon, 10 Jan 2022 13:16:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFFTD9v0rsUHdndM8JE1DYbDYsBaQeIasluGRKQ4KanNG1QGn9AABxK35esmYZC4UBpcQVGQ==
X-Received: by 2002:ac8:59c9:: with SMTP id f9mr1405117qtf.204.1641849417901; 
 Mon, 10 Jan 2022 13:16:57 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id t3sm5697872qtx.58.2022.01.10.13.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 13:16:57 -0800 (PST)
Date: Mon, 10 Jan 2022 18:16:50 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 1/3] python/aqmp: use absolute import statement
Message-ID: <20220110211650.2vvq66n55niymkls@laptop.redhat>
References: <20220110191349.1841027-1-jsnow@redhat.com>
 <20220110191349.1841027-2-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110191349.1841027-2-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 02:13:47PM -0500, John Snow wrote:
> pylint's dependency astroid appears to have bugs in 2.9.1 and 2.9.2 (Dec
> 31 and Jan 3) that appear to erroneously expect the qemu namespace to
> have an __init__.py file. astroid 2.9.3 (Jan 9) avoids that problem, but
> appears to not understand a relative import within a namespace package.
> 
> Update the relative import - it was worth changing anyway, because these
> packages will eventually be packaged and distributed separately.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/aqmp_tui.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
> index a2929f771c..f1e926dd75 100644
> --- a/python/qemu/aqmp/aqmp_tui.py
> +++ b/python/qemu/aqmp/aqmp_tui.py
> @@ -35,7 +35,8 @@
>  import urwid
>  import urwid_readline
>  
> -from ..qmp import QEMUMonitorProtocol, QMPBadPortError
> +from qemu.qmp import QEMUMonitorProtocol, QMPBadPortError
> +
>  from .error import ProtocolError
>  from .message import DeserializationError, Message, UnexpectedTypeError
>  from .protocol import ConnectError, Runstate
> -- 
> 2.31.1
> 
>

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


