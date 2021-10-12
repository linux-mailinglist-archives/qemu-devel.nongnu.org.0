Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C40842A918
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:08:36 +0200 (CEST)
Received: from localhost ([::1]:33378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKKR-0004o5-59
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maKIr-0003Va-JA
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:06:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maKIn-0002bb-BI
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634054811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ABBdUgwWimyiRXD4iyHEjMxHxVqW2X8xQdB/Ah35p+k=;
 b=PmnZezbgMZZckRYMdLBXcJcHOdlqGM7HY0RE1qLatM6OK7cPbE5+GW+d7OW0rkFfQoQstC
 A4BOsQhZB5H2kvEYqUO4bK1nDQtYuAnsHASQlCpfrHMFz6bm9GuDzUpnDSI/4/MSF3lLZR
 K0tR9IQzVpg/e4UfuUFK0UatJvfMY0o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-gZ8MBBqANwCUG4VdYNW01A-1; Tue, 12 Oct 2021 12:06:49 -0400
X-MC-Unique: gZ8MBBqANwCUG4VdYNW01A-1
Received: by mail-wr1-f71.google.com with SMTP id
 r25-20020adfab59000000b001609ddd5579so16127228wrc.21
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ABBdUgwWimyiRXD4iyHEjMxHxVqW2X8xQdB/Ah35p+k=;
 b=O6wCjypPWdwEgmqTaUWJRly92fvdshc/EP+p9ckHYvNBe79lnpLV+WUnicUKVb1laO
 9HY0jVRKLOq40GtcYflepy+mCm4npDMxAVTn/od2fS0FpIFw4IaquF3QV74McMP0qWYG
 bNCwfX61Jb9JCaj4hNVg0dSQFN3L26hhdXdFojv9RwFdAQefmHnmeHBoHIofUeV4Mtb+
 pxtJQSrG3pk7/mdBNTWDtb7wUcjriABOFoafYst6Umq4qVJO2mfErVKtog7WGqNdXt+M
 xj8j/zNg0D82cuDeQPsOL+2xO0QrTf0t44Dz/yyxC0XDRvR4cMDWSMy/w8595MyvSbVK
 QeNA==
X-Gm-Message-State: AOAM5339ErdPXgSveCCaGod/bSBQ50aE0J3mD8SbCUV5caZLcXHEGJwe
 jmQVCq3PWnxGQNXUfSyawwxQSk00nbSf8VikotcwHVpxtOqlSvUYTkBsr532cbL70hkTKVNv4bM
 Tv851m+LdCS/jYT0=
X-Received: by 2002:adf:d1ee:: with SMTP id g14mr33416057wrd.264.1634054808227; 
 Tue, 12 Oct 2021 09:06:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOS0U1U25GhDL8l6urUenlMlHnBc3d2rD8jR52rQ8JuSolJNoJqphzUJRv+x19CQRQGaBe7g==
X-Received: by 2002:adf:d1ee:: with SMTP id g14mr33416012wrd.264.1634054807894; 
 Tue, 12 Oct 2021 09:06:47 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id 1sm3058289wmb.24.2021.10.12.09.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 09:06:47 -0700 (PDT)
Message-ID: <4e34bf3c-c9eb-1bb5-15a1-a9e88a0b468f@redhat.com>
Date: Tue, 12 Oct 2021 18:06:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 13/17] iotests: Accommodate async QMP Exception classes
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210923004938.3999963-1-jsnow@redhat.com>
 <20210923004938.3999963-14-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20210923004938.3999963-14-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.452,
 DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.09.21 02:49, John Snow wrote:
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
>   tests/qemu-iotests/tests/mirror-top-perms | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
> index 4f03c121697..a403c35b08f 100755
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
> index 2fc8dd66e0a..9fe315e3b01 100755
> --- a/tests/qemu-iotests/tests/mirror-top-perms
> +++ b/tests/qemu-iotests/tests/mirror-top-perms
> @@ -26,6 +26,7 @@ from iotests import qemu_img
>   # Import qemu after iotests.py has amended sys.path
>   # pylint: disable=wrong-import-order
>   import qemu
> +from qemu.aqmp import ConnectError

With this change, the test emits the “AQMP is in development” warning, 
breaking the test.  Do we want to pull patch 16 before this patch?

(I also wonder whether we want to import QMPConnectError, too, because 
the `except (qemu.qmp.*, *)` below looks so... heterogeneous.)

Hanna

>   image_size = 1 * 1024 * 1024
> @@ -102,7 +103,7 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
>               self.vm_b.launch()
>               print('ERROR: VM B launched successfully, this should not have '
>                     'happened')
> -        except qemu.qmp.QMPConnectError:
> +        except (qemu.qmp.QMPConnectError, ConnectError):
>               assert 'Is another process using the image' in self.vm_b.get_log()
>   
>           result = self.vm.qmp('block-job-cancel',


