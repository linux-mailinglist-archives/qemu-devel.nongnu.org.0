Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2CD5350AC
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 16:32:00 +0200 (CEST)
Received: from localhost ([::1]:60500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuEWs-0007Gk-Tl
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 10:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nuEVJ-0006Le-Qf
 for qemu-devel@nongnu.org; Thu, 26 May 2022 10:30:21 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:34054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nuEVF-0003P8-4G
 for qemu-devel@nongnu.org; Thu, 26 May 2022 10:30:20 -0400
Received: from sas1-3cba3404b018.qloud-c.yandex.net
 (sas1-3cba3404b018.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd26:0:640:3cba:3404])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 127BD2E0F22;
 Thu, 26 May 2022 17:30:04 +0300 (MSK)
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net [2a02:6b8:c08:bd1e:0:640:7470:3316])
 by sas1-3cba3404b018.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 sUNr6ntP3h-U3KWu0cN; Thu, 26 May 2022 17:30:03 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1653575403; bh=ROon8n2V5l5/lx9xwAqVB+YkO7Fxm6dTrl4qt/ktnzY=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=V/HSXUSbElA4KPjo9UE7JXFTPXXJZNmh0R3NJm/rfEc7oThBdQZE5gFXhoWMyyFoV
 UUYMbjbF6p0l9BX9EyRbRKebmPD5punSJD/sLVOv8xPEA9x3XiHTg2r5nkYOVhxHfe
 xJ/MPzuMfoiUSg1Vw2ckzdQhqNIMAXbDK9rMp/I4=
Authentication-Results: sas1-3cba3404b018.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:b53f::1:17] (unknown
 [2a02:6b8:b081:b53f::1:17])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 zAKPo8Ggn5-U2MKKhoG; Thu, 26 May 2022 17:30:03 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <d14025a4-01ff-d1ff-deca-e3613a5955bc@yandex-team.ru>
Date: Thu, 26 May 2022 17:30:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] python/machine.py: upgrade vm.command() method
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 bleal@redhat.com, crosa@redhat.com, jsnow@redhat.com, eblake@redhat.com
References: <20220408170214.45585-1-vsementsov@openvz.org>
 <20220408170214.45585-2-vsementsov@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220408170214.45585-2-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 4/8/22 20:02, Vladimir Sementsov-Ogievskiy wrote:
> The method is not popular, we prefer use vm.qmp() and then check

Suddenly I found, that I missed a lot of existing users: in scripts, in avocado tests.

Do you prefer to rename the method to "cmd()", and change all the occurrences, or keep longer "command()" name and update the second patch?


$ git grep '\.command('
docs/devel/testing.rst:          res = self.vm.command('human-monitor-command',
docs/devel/testing.rst:          first_res = first_machine.command(
docs/devel/testing.rst:          second_res = second_machine.command(
docs/devel/testing.rst:          third_res = self.get_vm(name='third_machine').command(
python/qemu/machine/machine.py:        ret = self._qmp.command(cmd, **qmp_args)
python/qemu/utils/qemu_ga_client.py:            return self.command('guest-' + name.replace('_', '-'), **kwds)
python/qemu/utils/qom.py:        rsp = self.qmp.command(
python/qemu/utils/qom.py:        rsp = self.qmp.command(
python/qemu/utils/qom.py:                rsp = self.qmp.command('qom-get', path=path,
python/qemu/utils/qom_common.py:        rsp = self.qmp.command('qom-list', path=path)
python/qemu/utils/qom_fuse.py:            data = str(self.qmp.command('qom-get', path=path, property=prop))
python/qemu/utils/qom_fuse.py:        return prefix + str(self.qmp.command('qom-get', path=path,
scripts/device-crash-test:    types = vm.command('qom-list-types', **kwargs)
scripts/device-crash-test:    devhelp = vm.command('human-monitor-command', **args)
scripts/device-crash-test:            self.machines = list(m['name'] for m in vm.command('query-machines'))
scripts/device-crash-test:            self.kvm_available = vm.command('query-kvm')['enabled']
scripts/render_block_graph.py:    bds_nodes = qmp.command('query-named-block-nodes')
scripts/render_block_graph.py:    job_nodes = qmp.command('query-block-jobs')
scripts/render_block_graph.py:    block_graph = qmp.command('x-debug-query-block-graph')
tests/avocado/avocado_qemu/__init__.py:        res = self.vm.command('human-monitor-command',
tests/avocado/cpu_queries.py:        cpus = self.vm.command('query-cpu-definitions')
tests/avocado/cpu_queries.py:            e = self.vm.command('query-cpu-model-expansion', model=model, type='full')
tests/avocado/hotplug_cpu.py:        self.vm.command('device_add',
tests/avocado/info_usernet.py:        res = self.vm.command('human-monitor-command',
tests/avocado/machine_arm_integratorcp.py:        self.vm.command('human-monitor-command', command_line='stop')
tests/avocado/machine_arm_integratorcp.py:        self.vm.command('human-monitor-command',
tests/avocado/machine_m68k_nextcube.py:        self.vm.command('human-monitor-command',
tests/avocado/machine_mips_malta.py:        self.vm.command('human-monitor-command', command_line='stop')
tests/avocado/machine_mips_malta.py:        self.vm.command('human-monitor-command',
tests/avocado/machine_s390_ccw_virtio.py:        self.vm.command('device_del', id='rn1')
tests/avocado/machine_s390_ccw_virtio.py:        self.vm.command('device_del', id='rn2')
tests/avocado/machine_s390_ccw_virtio.py:        self.vm.command('device_add', driver='virtio-net-ccw',
tests/avocado/machine_s390_ccw_virtio.py:        self.vm.command('device_del', id='net_4711')
tests/avocado/machine_s390_ccw_virtio.py:        self.vm.command('human-monitor-command', command_line='balloon 96')
tests/avocado/machine_s390_ccw_virtio.py:        self.vm.command('human-monitor-command', command_line='balloon 128')
tests/avocado/machine_s390_ccw_virtio.py:            self.vm.command('screendump', filename=ppmfile.name)
tests/avocado/machine_s390_ccw_virtio.py:        self.vm.command('object-add', qom_type='cryptodev-backend-builtin',
tests/avocado/machine_s390_ccw_virtio.py:        self.vm.command('device_add', driver='virtio-crypto-ccw', id='crypdev0',
tests/avocado/machine_s390_ccw_virtio.py:        self.vm.command('device_del', id='crypdev0')
tests/avocado/machine_s390_ccw_virtio.py:        self.vm.command('object-del', id='cbe0')
tests/avocado/migration.py:        return vm.command('query-migrate')['status'] in ('completed', 'failed')
tests/avocado/migration.py:        self.assertEqual(src_vm.command('query-migrate')['status'], 'completed')
tests/avocado/migration.py:        self.assertEqual(dst_vm.command('query-migrate')['status'], 'completed')
tests/avocado/migration.py:        self.assertEqual(dst_vm.command('query-status')['status'], 'running')
tests/avocado/migration.py:        self.assertEqual(src_vm.command('query-status')['status'],'postmigrate')
tests/avocado/pc_cpu_hotplug_props.py:        self.assertEquals(len(self.vm.command('query-cpus-fast')), 2)
tests/avocado/version.py:        res = self.vm.command('human-monitor-command',
tests/avocado/virtio_check_params.py:        output = vm.command('human-monitor-command',
tests/avocado/virtio_check_params.py:            machines = [m['name'] for m in vm.command('query-machines')]
tests/avocado/virtio_version.py:    return devtype in [d['name'] for d in vm.command('qom-list-types', implements=implements)]
tests/avocado/virtio_version.py:            pcibuses = vm.command('query-pci')
tests/avocado/x86_cpu_model_versions.py:        cpus = dict((m['name'], m) for m in self.vm.command('query-cpu-definitions'))
tests/avocado/x86_cpu_model_versions.py:        cpus = dict((m['name'], m) for m in self.vm.command('query-cpu-definitions'))
tests/avocado/x86_cpu_model_versions.py:        cpus = dict((m['name'], m) for m in self.vm.command('query-cpu-definitions'))
tests/avocado/x86_cpu_model_versions.py:        cpu_path = self.vm.command('query-cpus-fast')[0].get('qom-path')
tests/avocado/x86_cpu_model_versions.py:        return self.vm.command('qom-get', path=cpu_path, property=prop)
tests/docker/docker.py:        dkr.command(cmd="pull", quiet=args.quiet,
tests/docker/docker.py:        dkr.command(cmd="tag", quiet=args.quiet,
tests/docker/docker.py:        return Docker().command("images", argv, args.quiet)
tests/migration/guestperf/engine.py:        info = vm.command("query-migrate")
tests/migration/guestperf/engine.py:        vcpus = src.command("query-cpus-fast")
tests/migration/guestperf/engine.py:            resp = src.command("migrate-set-capabilities",
tests/migration/guestperf/engine.py:            resp = src.command("migrate-set-parameters",
tests/migration/guestperf/engine.py:            resp = src.command("migrate-set-capabilities",
tests/migration/guestperf/engine.py:            resp = dst.command("migrate-set-capabilities",
tests/migration/guestperf/engine.py:        resp = src.command("migrate-set-parameters",
tests/migration/guestperf/engine.py:        resp = src.command("migrate-set-parameters",
tests/migration/guestperf/engine.py:            resp = src.command("migrate-set-capabilities",
tests/migration/guestperf/engine.py:            resp = src.command("migrate-set-parameters",
tests/migration/guestperf/engine.py:            resp = dst.command("migrate-set-capabilities",
tests/migration/guestperf/engine.py:            resp = dst.command("migrate-set-parameters",
tests/migration/guestperf/engine.py:            resp = src.command("migrate-set-capabilities",
tests/migration/guestperf/engine.py:            resp = dst.command("migrate-set-capabilities",
tests/migration/guestperf/engine.py:            resp = src.command("migrate-set-parameters",
tests/migration/guestperf/engine.py:            resp = src.command("migrate-set-capabilities",
tests/migration/guestperf/engine.py:            resp = src.command("migrate-set-parameters",
tests/migration/guestperf/engine.py:            resp = dst.command("migrate-set-capabilities",
tests/migration/guestperf/engine.py:            resp = dst.command("migrate-set-parameters",
tests/migration/guestperf/engine.py:        resp = src.command("migrate", uri=connect_uri)
tests/migration/guestperf/engine.py:                    dst.command("cont")
tests/migration/guestperf/engine.py:                src.command("migrate_cancel")
tests/migration/guestperf/engine.py:                src.command("migrate_cancel")
tests/migration/guestperf/engine.py:                resp = src.command("migrate-start-postcopy")
tests/migration/guestperf/engine.py:                resp = src.command("stop")




> success by hand.. But that's not optimal. To simplify movement to
> vm.command() support same interface improvements like in vm.qmp() and
> rename to shorter vm.cmd().
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   python/qemu/machine/machine.py | 16 ++++++++++++---
>   tests/qemu-iotests/256         | 34 ++++++++++++++++----------------
>   tests/qemu-iotests/257         | 36 +++++++++++++++++-----------------
>   3 files changed, 48 insertions(+), 38 deletions(-)
> 
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index 07ac5a710b..a3fb840b93 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -648,14 +648,24 @@ def qmp(self, cmd: str,
>               self._quit_issued = True
>           return ret
>   
> -    def command(self, cmd: str,
> -                conv_keys: bool = True,
> -                **args: Any) -> QMPReturnValue:
> +    def cmd(self, cmd: str,
> +            args_dict: Optional[Dict[str, object]] = None,
> +            conv_keys: Optional[bool] = None,
> +            **args: Any) -> QMPReturnValue:
>           """
>           Invoke a QMP command.
>           On success return the response dict.
>           On failure raise an exception.
>           """
> +        if args_dict is not None:
> +            assert not args
> +            assert conv_keys is None
> +            args = args_dict
> +            conv_keys = False
> +
> +        if conv_keys is None:
> +            conv_keys = True
> +
>           qmp_args = self._qmp_args(conv_keys, args)
>           ret = self._qmp.command(cmd, **qmp_args)
>           if cmd == 'quit':
> diff --git a/tests/qemu-iotests/256 b/tests/qemu-iotests/256
> index 13666813bd..fffc8ef055 100755
> --- a/tests/qemu-iotests/256
> +++ b/tests/qemu-iotests/256
> @@ -40,25 +40,25 @@ with iotests.FilePath('img0') as img0_path, \
>       def create_target(filepath, name, size):
>           basename = os.path.basename(filepath)
>           nodename = "file_{}".format(basename)
> -        log(vm.command('blockdev-create', job_id='job1',
> -                       options={
> -                           'driver': 'file',
> -                           'filename': filepath,
> -                           'size': 0,
> -                       }))
> +        log(vm.cmd('blockdev-create', job_id='job1',
> +                   options={
> +                       'driver': 'file',
> +                       'filename': filepath,
> +                       'size': 0,
> +                   }))
>           vm.run_job('job1')
> -        log(vm.command('blockdev-add', driver='file',
> -                       node_name=nodename, filename=filepath))
> -        log(vm.command('blockdev-create', job_id='job2',
> -                       options={
> -                           'driver': iotests.imgfmt,
> -                           'file': nodename,
> -                           'size': size,
> -                       }))
> +        log(vm.cmd('blockdev-add', driver='file',
> +                   node_name=nodename, filename=filepath))
> +        log(vm.cmd('blockdev-create', job_id='job2',
> +                   options={
> +                       'driver': iotests.imgfmt,
> +                       'file': nodename,
> +                       'size': size,
> +                   }))
>           vm.run_job('job2')
> -        log(vm.command('blockdev-add', driver=iotests.imgfmt,
> -                       node_name=name,
> -                       file=nodename))
> +        log(vm.cmd('blockdev-add', driver=iotests.imgfmt,
> +                   node_name=name,
> +                   file=nodename))
>   
>       log('--- Preparing images & VM ---\n')
>       vm.add_object('iothread,id=iothread0')
> diff --git a/tests/qemu-iotests/257 b/tests/qemu-iotests/257
> index e7e7a2317e..7d3720b8e5 100755
> --- a/tests/qemu-iotests/257
> +++ b/tests/qemu-iotests/257
> @@ -160,26 +160,26 @@ class Drive:
>           file_node_name = "file_{}".format(basename)
>           vm = self.vm
>   
> -        log(vm.command('blockdev-create', job_id='bdc-file-job',
> -                       options={
> -                           'driver': 'file',
> -                           'filename': self.path,
> -                           'size': 0,
> -                       }))
> +        log(vm.cmd('blockdev-create', job_id='bdc-file-job',
> +                   options={
> +                       'driver': 'file',
> +                       'filename': self.path,
> +                       'size': 0,
> +                   }))
>           vm.run_job('bdc-file-job')
> -        log(vm.command('blockdev-add', driver='file',
> -                       node_name=file_node_name, filename=self.path))
> -
> -        log(vm.command('blockdev-create', job_id='bdc-fmt-job',
> -                       options={
> -                           'driver': fmt,
> -                           'file': file_node_name,
> -                           'size': size,
> -                       }))
> +        log(vm.cmd('blockdev-add', driver='file',
> +                   node_name=file_node_name, filename=self.path))
> +
> +        log(vm.cmd('blockdev-create', job_id='bdc-fmt-job',
> +                   options={
> +                       'driver': fmt,
> +                       'file': file_node_name,
> +                       'size': size,
> +                   }))
>           vm.run_job('bdc-fmt-job')
> -        log(vm.command('blockdev-add', driver=fmt,
> -                       node_name=name,
> -                       file=file_node_name))
> +        log(vm.cmd('blockdev-add', driver=fmt,
> +                   node_name=name,
> +                   file=file_node_name))
>           self.fmt = fmt
>           self.size = size
>           self.node = name


-- 
Best regards,
Vladimir

