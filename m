Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 895DB4E5413
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 15:12:53 +0100 (CET)
Received: from localhost ([::1]:51926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1jI-0006WF-IN
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 10:12:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX1c9-0003S2-2n
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 10:05:30 -0400
Received: from smtp46.i.mail.ru ([94.100.177.106]:38472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX1c3-0002VN-IV
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 10:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=zVO2RHwSDq6XBCzgGZ8y1cAl3rInqx+sFTibkfQINC8=; 
 t=1648044323;x=1648649723; 
 b=ZJEi81etXwJZWwPMndq+YCELk09vJQdUvINHBBp9Ra5YLsCOJWlTi/UXJFED1+q1rp7M/VabhR2OtUQPUr33QoIuHCg0PFnxUneIEZ3cJIqA+thPwyHT7XCg4PKHsMo4jEn09PjtIxRm5qUOmK32bTBxAnFVqyg7BtHgClu0ogc4L+kIDdEevaKJ+ArsrjaWiNSP53G91CFexrcX5a4GQ5YGPlkfYj/UcKhXBn7VD1wwwOvD8V44skcBraJpwrLF0JenDCi1+5f7Q3kHcvah/IRu7gu8oZjXr4Km15jUaxyb13ROcd8j/SAc3CZODXb01Hi3DysmE2vIIdoiPYxMQA==;
Received: by smtp46.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nX1bz-0004r9-Cb; Wed, 23 Mar 2022 17:05:19 +0300
Message-ID: <42a78664-b45f-a8a6-2476-08fa5d3e8034@mail.ru>
Date: Wed, 23 Mar 2022 17:05:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 8/8] migration: Test for RAM and vmstate parts
Content-Language: en-US
To: Nikita Lapshin <nikita.lapshin@openvz.org>, qemu-devel@nongnu.org
Cc: den@openvz.org, Nikita Lapshin <nikita.lapshin@virtuozzo.com>
References: <20220323105400.17649-1-nikita.lapshin@openvz.org>
 <20220323105400.17649-9-nikita.lapshin@openvz.org>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220323105400.17649-9-nikita.lapshin@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp46.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196DC6E89A8CCEF2E51DF9B70E0E78BE6910182A05F538085040A91351B5CBCBCB498CE68850FD9D306B8FF5606C22FA00662EA9E02725889D93
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A4C4638C9DDF45FCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375F0BD5CF353A411D8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D80AF6976B858DBE6556D476B4EE8BEB456F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE73CD73D99384BA5CA9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B2EE5AD8F952D28FBA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC040E0003A52AFEF73AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006376A45045F672EF67AD81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F1FC58B5115ECA9A2CE5475246E174218B5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A52678519D03D780872D5C359C7BD2ABEA3AD65418D7647769D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3455AC8BF8E3153BA0D63F2A3B1056AFD2546F10AF0C0C280C4AC893BE4A12C4E9249A5C238CE29A2C1D7E09C32AA3244CD78E75A0DAE0061975251A6456C33AD35A1673A01BA68E40927AC6DF5659F194
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojVRXGxxa4QmC1C8tLPSAFog==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F155C1DBC7841DC5D012F3F44C9E28D4E47A3FD40067C640BF3E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.106;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp46.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

23.03.2022 13:54, Nikita Lapshin wrote:
> From: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
> 
> All other parts works just like existed capabilities.
> Though RAM and vmstate are new so here is new test for
> that parts.
> 
> Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
> ---
>   .../tests/migrate-ram-stream-content-test     | 96 +++++++++++++++++++
>   .../tests/migrate-ram-stream-content-test.out |  5 +
>   2 files changed, 101 insertions(+)
>   create mode 100755 tests/qemu-iotests/tests/migrate-ram-stream-content-test
>   create mode 100644 tests/qemu-iotests/tests/migrate-ram-stream-content-test.out
> 
> diff --git a/tests/qemu-iotests/tests/migrate-ram-stream-content-test b/tests/qemu-iotests/tests/migrate-ram-stream-content-test
> new file mode 100755
> index 0000000000..2855ca4a64
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/migrate-ram-stream-content-test
> @@ -0,0 +1,96 @@
> +#!/usr/bin/env python3
> +# group: rw migration
> +#
> +# Tests for 'no-ram' and 'ram-only' capabilities
> +#
> +# Copyright (c) 2021 Virtuozzo International GmbH.
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
> +import json
> +import subprocess
> +import iotests
> +
> +img = os.path.join(iotests.test_dir, 'disk.img')
> +
> +class TestRamCapabilities(iotests.QMPTestCase):
> +    def setUp(self):
> +        iotests.qemu_img('create', '-f', iotests.imgfmt, img, '10M')
> +        self.vm = iotests.VM()
> +        self.vm.launch()
> +        self.vm.qmp('migrate-set-capabilities', capabilities=[
> +            {
> +                'capability': 'events',
> +                'state': True
> +            }
> +        ])
> +
> +    def tearDown(self):
> +        self.vm.shutdown()
> +        os.remove(img)
> +
> +    def check_ram_only(self, output):
> +        str_json = output.decode()
> +        json_obj = json.loads(str_json)
> +
> +        success = False
> +        for key in json_obj:
> +            self.assertTrue("ram" in key)
> +            success = True
> +        self.assertTrue(success)

I'd write it like this:

self.assertTrue(len(json_obj) > 0)
self.assertTrue(all('ram' in key for key in json_obj))

> +
> +    def run_migration(self, no_ram, tmp_stream):
> +        if no_ram:
> +            output = self.vm.qmp('migrate-set-parameters',
> +                    stream_content_list = ['vmstate'])
> +        else:
> +            self.vm.qmp('migrate-set-parameters',
> +                    stream_content_list = ['ram'])

It would look better if just pass stream_content list argument to the function.

> +
> +        self.vm.qmp('migrate', uri='exec:cat>' + tmp_stream)
> +
> +        while True:
> +            event = self.vm.event_wait('MIGRATION')
> +
> +            if event['data']['status'] == 'completed':
> +                break
> +
> +
> +    def test_no_ram(self):
> +        with iotests.FilePath('tmp_stream') as tmp_stream:
> +            self.run_migration(True, tmp_stream)
> +            output = subprocess.run(
> +                ['../../../scripts/analyze-migration.py', '-f', tmp_stream],
> +                stdout=subprocess.PIPE,
> +                stderr=subprocess.STDOUT,
> +                check=False).stdout
> +
> +            self.assertFalse('ram' in output.decode())
> +
> +    def test_ram_only(self):
> +        with iotests.FilePath('tmp_stream') as tmp_stream:
> +            self.run_migration(False, tmp_stream)
> +            output = subprocess.run(
> +                ['../../../scripts/analyze-migration.py', '-f', tmp_stream,
> +                    '--ram-only'],
> +                stdout=subprocess.PIPE,
> +                stderr=subprocess.STDOUT,
> +                check=False).stdout
> +
> +            self.check_ram_only(output)


Hmm both test cases are mostly the same - may be refactored a bit mor eto not duplicate.


> +
> +if __name__ == '__main__':
> +    iotests.main(supported_protocols=['file'])
> diff --git a/tests/qemu-iotests/tests/migrate-ram-stream-content-test.out b/tests/qemu-iotests/tests/migrate-ram-stream-content-test.out
> new file mode 100644
> index 0000000000..fbc63e62f8
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/migrate-ram-stream-content-test.out
> @@ -0,0 +1,5 @@
> +..
> +----------------------------------------------------------------------
> +Ran 2 tests
> +
> +OK

Looks good in general

-- 
Best regards,
Vladimir

