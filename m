Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E95406D80
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 16:19:34 +0200 (CEST)
Received: from localhost ([::1]:38130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOhNN-0006Hm-Qx
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 10:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mOhMK-0005UV-BY
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:18:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mOhMG-0008Ff-AZ
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:18:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631283502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3HBMZLXfqmkjqIcd1i/o7FO+xjo/ecmKoC/UG60gUxU=;
 b=chxIsJfv5DlaPr/UU4TaGZq3J49I1LJly/7qbZcmhIecokxkD8DAJ5E0RmtMj/qPWwPgAO
 Ikd6biAN4Dte4ij3WYErh/FxL7irOMKQfD5qY8jKsKHurQfBI8viJM9F8x4LVHjD6cirTK
 mtLNv4rTHOTXNeLCo1zNUemlsPF56/A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-E-YYJUSvNMSeEYkTebb0Ng-1; Fri, 10 Sep 2021 10:18:21 -0400
X-MC-Unique: E-YYJUSvNMSeEYkTebb0Ng-1
Received: by mail-wr1-f72.google.com with SMTP id
 b8-20020a5d5508000000b001574e8e9237so563507wrv.16
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 07:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3HBMZLXfqmkjqIcd1i/o7FO+xjo/ecmKoC/UG60gUxU=;
 b=masxEt8sgoYJIgAleGBu0LciQjf/c+M8uZNNVoaGtqkU7U02Zze4Rtttbw/ga6+hPp
 GzbC7gPTVP4FJBJDrR8XcONSQDzlK7BomBSJhpCvM30aB+bXBTPRFPDWBs1oW9VmaDHw
 klOzaFnER11RnDC4qry+H+apQiCsmNzK4urV5I7BMeHGD0gwIg7QlFrAmQD6LI3ACoFG
 bBRdd7iCZIc5CnWTStgC5rVS2mQH0Ovsd8yikvDZZFt0Efx+XWRrLImzwNk9pDmrTvgu
 kr5cqkpG3Fct27WnHlYKKwce5jPoLCqjcEGWFCuV2eoBWMZhQ4Udf2WM1g7Olmb47yTh
 PCrA==
X-Gm-Message-State: AOAM532677ADa5vbhTm+U2GpA09gt+HpdtUWttckCM7NgCBFqAlLk28Y
 +TcKWIIhTzgP2V9ZL6Hwslt6/Ln+V3iZYggnkRiqcks+iMZLo95w3dw6zRW1AizCbLF5heLxdLY
 2eHTwBCQLvcZ5jzE=
X-Received: by 2002:a5d:64e3:: with SMTP id g3mr10303983wri.396.1631283499945; 
 Fri, 10 Sep 2021 07:18:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4ByVq1iRqtPgnm0Et7CZmnT++82TDGbb297WutITar2cFQ/nJ0cyDAmAB+UdB4wICPhT49w==
X-Received: by 2002:a5d:64e3:: with SMTP id g3mr10303944wri.396.1631283499640; 
 Fri, 10 Sep 2021 07:18:19 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id z7sm5745339wre.72.2021.09.10.07.18.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 07:18:19 -0700 (PDT)
Subject: Re: [PATCH 1/2] tests: add migrate-during-backup
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210910110100.31976-1-vsementsov@virtuozzo.com>
 <20210910110100.31976-2-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <8c7f8685-13f0-521c-8de1-97e47141bfe6@redhat.com>
Date: Fri, 10 Sep 2021 16:18:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210910110100.31976-2-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.09.21 13:00, Vladimir Sementsov-Ogievskiy wrote:
> Add a simple test which tries to run migration during backup.
> bdrv_inactivate_all() should fail. But due to bug (see next commit with
> fix) it doesn't, nodes are inactivated and continued backup crashes
> on assertion "assert(!(bs->open_flags & BDRV_O_INACTIVE));" in
> bdrv_co_write_req_prepare().
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   .../qemu-iotests/tests/migrate-during-backup  | 87 +++++++++++++++++++
>   .../tests/migrate-during-backup.out           |  5 ++
>   2 files changed, 92 insertions(+)
>   create mode 100755 tests/qemu-iotests/tests/migrate-during-backup
>   create mode 100644 tests/qemu-iotests/tests/migrate-during-backup.out
>
> diff --git a/tests/qemu-iotests/tests/migrate-during-backup b/tests/qemu-iotests/tests/migrate-during-backup
> new file mode 100755
> index 0000000000..c3b7f1983d
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/migrate-during-backup
> @@ -0,0 +1,87 @@
> +#!/usr/bin/env python3
> +# group: migration disabled
> +#
> +# Copyright (c) 2021 Virtuozzo International GmbH
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +#
> +
> +import os
> +import iotests
> +from iotests import qemu_img_create, qemu_io
> +
> +
> +disk_a = os.path.join(iotests.test_dir, 'disk_a')
> +disk_b = os.path.join(iotests.test_dir, 'disk_b')
> +size = '1M'
> +mig_file = os.path.join(iotests.test_dir, 'mig_file')
> +mig_cmd = 'exec: cat > ' + mig_file
> +
> +
> +class TestMigrateDuringBackup(iotests.QMPTestCase):
> +    def tearDown(self):
> +        self.vm.shutdown()
> +        os.remove(disk_a)
> +        os.remove(disk_b)
> +        os.remove(mig_file)
> +
> +    def setUp(self):
> +        qemu_img_create('-f', iotests.imgfmt, disk_a, size)
> +        qemu_img_create('-f', iotests.imgfmt, disk_b, size)
> +        qemu_io('-c', f'write 0 {size}', disk_a)
> +
> +        self.vm = iotests.VM().add_drive(disk_a)
> +        self.vm.launch()
> +        result = self.vm.qmp('blockdev-add', {
> +            'node-name': 'target',
> +            'driver': iotests.imgfmt,
> +            'file': {
> +                'driver': 'file',
> +                'filename': disk_b
> +            }
> +        })
> +        self.assert_qmp(result, 'return', {})
> +
> +    def test_migrate(self):
> +        result = self.vm.qmp('blockdev-backup', device='drive0',
> +                             target='target', sync='full',
> +                             speed=1, x_perf={
> +                                 'max-workers': 1,
> +                                 'max-chunk': 64 * 1024
> +                             })
> +        self.assert_qmp(result, 'return', {})
> +
> +        result = self.vm.qmp('job-pause', id='drive0')
> +        self.assert_qmp(result, 'return', {})
> +
> +        result = self.vm.qmp('migrate-set-capabilities',
> +                             capabilities=[{'capability': 'events',
> +                                            'state': True}])
> +        self.assert_qmp(result, 'return', {})
> +        result = self.vm.qmp('migrate', uri=mig_cmd)
> +        self.assert_qmp(result, 'return', {})
> +
> +        self.vm.events_wait((('MIGRATION', {'data': {'status': 'completed'}}),
> +                             ('MIGRATION', {'data': {'status': 'failed'}})))

So the migration failing is the result we expect here, right? Perhaps we 
should then have a loop that waits for MIGRATION events, and breaks on 
both status=completed and status=failed, but logs an error if the 
migration completes unexpectedly.

While I’ll give a

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

either way, I’d like to know your opinion on this still.

Hanna

> +
> +        result = self.vm.qmp('block-job-set-speed', device='drive0',
> +                             speed=0)
> +        self.assert_qmp(result, 'return', {})
> +        result = self.vm.qmp('job-resume', id='drive0')
> +        self.assert_qmp(result, 'return', {})
> +
> +
> +if __name__ == '__main__':
> +    iotests.main(supported_fmts=['qcow2'],
> +                 supported_protocols=['file'])
> diff --git a/tests/qemu-iotests/tests/migrate-during-backup.out b/tests/qemu-iotests/tests/migrate-during-backup.out
> new file mode 100644
> index 0000000000..ae1213e6f8
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/migrate-during-backup.out
> @@ -0,0 +1,5 @@
> +.
> +----------------------------------------------------------------------
> +Ran 1 tests
> +
> +OK


