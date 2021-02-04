Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDA830F1CC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 12:17:43 +0100 (CET)
Received: from localhost ([::1]:53466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cdq-000774-RB
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 06:17:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1l7cbM-0006Tb-52
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:15:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1l7cbK-0000aC-2R
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:15:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612437304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ligznXOZ6Z1zOsknSUdjjEZjRdmB743lxtyQ8e6Qi0E=;
 b=OhQ+qmC/BZ6+HZ3SOujqtt3wCmcuRpGt0AEIzQG8WBc9J2OcrufZvFviNSYaSSMS1qfncP
 Tkzkc/CXsWqTIAiAP0LNKodD8iuE9OHrMur4BA3CWrWVWMdD52YID1Vvqki2KSqvLsKXQG
 klbFYu9dowDX8oO71sRsB1hxK+xb0Wk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-3ZRWMtW9MEWkcFWsSRlCPQ-1; Thu, 04 Feb 2021 06:15:01 -0500
X-MC-Unique: 3ZRWMtW9MEWkcFWsSRlCPQ-1
Received: by mail-qv1-f69.google.com with SMTP id a12so1917175qvo.3
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 03:15:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ligznXOZ6Z1zOsknSUdjjEZjRdmB743lxtyQ8e6Qi0E=;
 b=OTVzEW/NgbdX9lIs/Ba7RxvH+a+gEj/kqeVQ0mi/s88aNsn94Yv2fGs4FqByTSYYwa
 oXMI7YLWHty8NMxRW0AmsJLOIKfX20xQf7zU2uoiVK1xjQGi9848SlAWRm7qlw4HUOMj
 RSsorCus5ykU0+uBvhX15lTOf8kGClZ2ufpgmFIKFjD6PWbgFomKlDj9E/JkZW11UlNf
 kRns/wLnSGI6Msq7lOOllkCTwaLYPkoNZtBQ3DvZuwFITF0WxpAt60t8GBFfpUJxdKeD
 twBm9KwIYgq52+lGKgPkNFTQpX9CadQ1+PSRRXptD1xxJzM09/YvBkdPsI6sQQUjqkRk
 NkQg==
X-Gm-Message-State: AOAM5310kGE7+x8xuU2WqWqXOwMjZOzgCbR+fFRl5lLabNZ1LcxH5eSY
 uvkKOLpkMv/An9zloqPVn9a/cQJ3W5dMljQ+DTDOoRjtATxReWK6WYJbcjhyfEH+rX0jB2anza3
 Zfo+3fQFp8tPVeaY=
X-Received: by 2002:a05:6214:d6d:: with SMTP id
 13mr7256792qvs.60.1612437300706; 
 Thu, 04 Feb 2021 03:15:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9lGbDwWKB1dXR3NH/h72lAensTjav+WVxEuzyAUrTo9UAASpYibrkgf1K+ZczHEoVB2SfZw==
X-Received: by 2002:a05:6214:d6d:: with SMTP id
 13mr7256766qvs.60.1612437300484; 
 Thu, 04 Feb 2021 03:15:00 -0800 (PST)
Received: from localhost ([181.191.236.144])
 by smtp.gmail.com with ESMTPSA id c139sm4858311qke.83.2021.02.04.03.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 03:14:59 -0800 (PST)
Date: Thu, 4 Feb 2021 08:14:57 -0300
From: Beraldo Leal <bleal@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 08/22] tests/acceptance/virtiofs_submounts.py:
 standardize port as integer
Message-ID: <20210204111457.enkgwqxlscrcw5dd@laptop.redhat>
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-9-crosa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-9-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 12:23:43PM -0500, Cleber Rosa wrote:
> Instead of having to cast it whenever it's going to be used, let's
> standardize it as an integer, which is the data type that will be
> used most often.
> 
> Given that the regex will only match digits, it's safe that we'll
> end up getting a integer, but, it could as well be a zero.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtiofs_submounts.py | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
> index f25a386a19..227a3cf1ee 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -86,17 +86,18 @@ class VirtiofsSubmountsTest(BootLinux):
>                  re.search(r'TCP.HOST_FORWARD.*127\.0\.0\.1\s*(\d+)\s+10\.',
>                            line)
>              if match is not None:
> -                port = match[1]
> +                port = int(match[1])
>                  break
>  
>          self.assertIsNotNone(port)
> -        self.log.debug('sshd listening on port: ' + port)
> +        self.assertGreater(port, 0)
> +        self.log.debug('sshd listening on port: %d', port)
>          return port
>  
>      def ssh_connect(self, username, keyfile):
>          self.ssh_logger = logging.getLogger('ssh')
>          port = self.get_portfwd()
> -        self.ssh_session = ssh.Session('127.0.0.1', port=int(port),
> +        self.ssh_session = ssh.Session('127.0.0.1', port=port,
>                                         user=username, key=keyfile)
>          for i in range(10):
>              try:
> -- 
> 2.25.4
>

Reviewed-by: Beraldo Leal <bleal@redhat.com>


