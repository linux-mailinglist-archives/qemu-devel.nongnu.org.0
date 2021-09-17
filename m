Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C238040FAD8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:54:59 +0200 (CEST)
Received: from localhost ([::1]:60210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFGU-0005Rn-S9
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRExg-0003hn-VD
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:35:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRExZ-000377-41
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631889324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4HPAaernueLEXQHI8foK4Jczca2GjTKG1F8nfF4P634=;
 b=J1Efpit7WOSxT01Ye3T2+7yaoAgSHWgfcFPBjn0EIP2kZ5y1qwgYg44MvCw5PWmQZ/lZRP
 nafDKfB5Nb2yx3xuOFvjFsq8yCQukgdiAe2pwDGaPazEKpXNWXJwbPvJZvEok4RumOq9Id
 QWlofBS/lLdZdEXcldpG6wInwGNiQyg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-8N3CCLbsO26_Z1SH9kbWSA-1; Fri, 17 Sep 2021 10:35:23 -0400
X-MC-Unique: 8N3CCLbsO26_Z1SH9kbWSA-1
Received: by mail-wr1-f70.google.com with SMTP id
 z1-20020adfec81000000b0015b085dbde3so3800282wrn.14
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 07:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4HPAaernueLEXQHI8foK4Jczca2GjTKG1F8nfF4P634=;
 b=qtI8YiV7chBhR/wy+B43Z4+HDSG5jvS2KpmK+q4k5MDGDkaiNiWOkM5ZjfikKUp/3k
 BUByClCern00troy5DD0s7KY4pmrpM9Ttwa/8mAfwk0+nVuPJr9qOQiedj8ayzT3fJM0
 ebTwdo6ri9+ltKj2bXirZ6IK1bowQP4ff1JC1RYDfBB6rk1qXZ3XIdlFSQ9LvSBoONyh
 2atVzkpZ5lPeX7VJ2DWZM/++aEKxC3PhVR3Y8CrEHoy6RfvS+eqDiu8N/xLH2rexUtKw
 Xk8nvwKpMZYU7uU46wasfCHPPOhs3CRi0tuBkOCEDNXHbw8+Lc6O9KZPhuYhPJJIq5lg
 xZEw==
X-Gm-Message-State: AOAM531DWqr2kYa5Q5zY9vpbxOlqKnn4n/lSevVmkNfpL4Ln+edN5fZp
 rGdseo2wBHZ7dEtQALKsMRO6cealvcP2rjJjbGxxuamZYWDKOlUDLgeLlpQ0JY3uQxKcWQzbtBJ
 NGZrq1jNYE4Hk7wM=
X-Received: by 2002:a05:6000:1889:: with SMTP id
 a9mr8660597wri.300.1631889322106; 
 Fri, 17 Sep 2021 07:35:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAC+NVuWjSiRKdeNfVDUl3ROzijNUAm9os6NSwtcigQ8cC3fD+2G8kJbX9j6aRuFE3V/LIww==
X-Received: by 2002:a05:6000:1889:: with SMTP id
 a9mr8660565wri.300.1631889321883; 
 Fri, 17 Sep 2021 07:35:21 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id o17sm7007557wrj.96.2021.09.17.07.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 07:35:21 -0700 (PDT)
Subject: Re: [PATCH 13/15] iotests: Accommodate async QMP Exception classes
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-14-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <5ef334d0-515b-42bf-01a0-b933c413c01e@redhat.com>
Date: Fri, 17 Sep 2021 16:35:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917054047.2042843-14-jsnow@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> (But continue to support the old ones for now, too.)
>
> There are very few cases of any user of QEMUMachine or a subclass
> thereof relying on a QMP Exception type. If you'd like to check for
> yourself, you want to grep for all of the derivatives of QMPError,
> excluding 'AQMPError' and its derivatives. That'd be these:
>
> - QMPError
> - QMPConnectError
> - QMPCapabilitiesError
> - QMPTimeoutError
> - QMPProtocolError
> - QMPResponseError
> - QMPBadPortError
>
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   scripts/simplebench/bench_block_job.py    | 3 ++-
>   tests/qemu-iotests/tests/mirror-top-perms | 6 +++++-
>   2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
> index 4f03c12169..a403c35b08 100755
> --- a/scripts/simplebench/bench_block_job.py
> +++ b/scripts/simplebench/bench_block_job.py
> @@ -28,6 +28,7 @@
>   sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
>   from qemu.machine import QEMUMachine
>   from qemu.qmp import QMPConnectError
> +from qemu.aqmp import ConnectError
>   
>   
>   def bench_block_job(cmd, cmd_args, qemu_args):
> @@ -49,7 +50,7 @@ def bench_block_job(cmd, cmd_args, qemu_args):
>           vm.launch()
>       except OSError as e:
>           return {'error': 'popen failed: ' + str(e)}
> -    except (QMPConnectError, socket.timeout):
> +    except (QMPConnectError, ConnectError, socket.timeout):
>           return {'error': 'qemu failed: ' + str(vm.get_log())}
>   
>       try:
> diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
> index 451a0666f8..7d448f4d23 100755
> --- a/tests/qemu-iotests/tests/mirror-top-perms
> +++ b/tests/qemu-iotests/tests/mirror-top-perms
> @@ -103,7 +103,11 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
>               print('ERROR: VM B launched successfully, this should not have '
>                     'happened')
>           except qemu.qmp.QMPConnectError:
> -            assert 'Is another process using the image' in self.vm_b.get_log()
> +            pass
> +        except qemu.aqmp.ConnectError:
> +            pass
> +
> +        assert 'Is another process using the image' in self.vm_b.get_log()

But this assertion will fail if there was no exception, and so we won’t 
get to see the real problem, which is the original VM aborting (see the 
doc string).

It doesn’t really matter that much that VM B can start (hence it being a 
logged error message, not a fatal error), and when it can start, of 
course it won’t print an error – but what’s important is that the 
original VM will then abort.

I mean, not an absolute showstopper by any means, but still, the 
assertion was deliberately placed into the `except` block.

Hanna


